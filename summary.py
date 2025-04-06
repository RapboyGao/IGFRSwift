import os
import re

def read_file_contents(file_path):
    try:
        with open(file_path, 'r', encoding='utf-8') as f:
            return f.read()
    except Exception as e:
        return f"// 读取文件失败: {e}"

def parse_gitignore():
    """解析.gitignore文件，返回匹配函数"""
    ignore_patterns = []
    if os.path.exists('.gitignore'):
        with open('.gitignore', 'r', encoding='utf-8') as f:
            for line in f:
                line = line.strip()
                if not line or line.startswith('#'):
                    continue
                # 处理路径规范化为Unix格式
                line = line.replace('\\', '/')
                # 生成正则表达式
                pattern = line
                # 处理目录匹配（如末尾/）
                is_dir = pattern.endswith('/')
                if is_dir:
                    pattern = pattern.rstrip('/')
                # 转义正则特殊字符
                pattern = re.escape(pattern)
                # 将.gitignore通配符转换为正则
                pattern = pattern.replace(r'\*', '[^/]*')         # 单级*
                pattern = pattern.replace(r'\*\*', '.*')          # 多级**
                pattern = pattern.replace(r'\/\*\*', '(/.*)?')   # 处理**/情况
                # 处理根目录匹配
                if line.startswith('/'):
                    pattern = pattern.replace(r'\/', '', 1)  # 移除转义后的首字符/
                    regex = f'^{pattern}'
                else:
                    regex = f'.*{pattern}'
                # 处理目录匹配（如build/匹配目录）
                if is_dir:
                    regex += r'(/.*|$)'
                else:
                    regex += r'$'
                ignore_patterns.append(re.compile(regex))
    return ignore_patterns

def is_ignored(path, ignore_patterns):
    """检查路径是否匹配.gitignore规则"""
    for regex in ignore_patterns:
        if regex.search(path):
            return True
    return False

def main():
    ignore_patterns = parse_gitignore()
    swift_files = []

    for root, dirs, files in os.walk('.', topdown=True):
        # 动态过滤被忽略的目录
        rel_root = os.path.relpath(root, '.').replace('\\', '/')
        if rel_root == '.':
            rel_root = ''
        # 检查并移除被忽略的目录
        dirs[:] = [d for d in dirs if not is_ignored(
            os.path.join(rel_root, d).replace('\\', '/'), ignore_patterns
        )]
        # 处理文件
        for file in files:
            if not file.endswith('.swift'):
                continue
            rel_path = os.path.join(rel_root, file).replace('\\', '/')
            if is_ignored(rel_path, ignore_patterns) or ".build" in rel_path:
                continue
            full_path = os.path.join(root, file)
            content = read_file_contents(full_path)
            swift_files.append((rel_path, content))

    # 生成Markdown文件
    with open('summary.txt', 'w', encoding='utf-8') as md:
        for path, content in swift_files:
            md.write(f'## {path}\n\n```swift\n{content}\n```\n\n')

if __name__ == '__main__':
    main()