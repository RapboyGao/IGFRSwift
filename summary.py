import os

def gather_swift_files():
    swift_files = []
    for root, _, files in os.walk('.'):
        for file in files:
            if file.endswith('.swift'):
                # 处理相对路径
                rel_path = os.path.join(root, file)
                rel_path = rel_path.replace('\\', '/')  # 统一为斜杠
                if rel_path.startswith('./'):
                    rel_path = rel_path[2:]  # 移除开头的./
                swift_files.append(rel_path)
    return swift_files

def read_file_contents(file_path):
    try:
        with open(file_path, 'r', encoding='utf-8') as f:
            return f.read()
    except Exception as e:
        return f"// Error reading file: {e}"

def main():
    # 收集所有.swift文件的路径和内容
    file_list = []
    for root, _, files in os.walk('.'):
        for file in files:
            if file.endswith('.swift'):
                rel_path = os.path.join(root, file)
                # 处理路径格式
                formatted_path = rel_path.replace('\\', '/')
                if formatted_path.startswith('./'):
                    formatted_path = formatted_path[2:]
                # 读取内容
                content = read_file_contents(rel_path)
                file_list.append((formatted_path, content))
    
    # 写入summary.md文件
    with open('summary.md', 'w', encoding='utf-8') as md_file:
        for path, content in file_list:
            md_file.write(f'## {path}\n\n```swift\n{content}\n```\n\n')

if __name__ == "__main__":
    main()