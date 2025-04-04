import os

def parse_igrf_file(file_path, version):
    """解析单个IGRF文件"""
    with open(file_path, 'r', encoding='utf-8') as f:
        lines = [line.strip() for line in f if line.strip() and not line.startswith('#')]
    
    # 解析头部信息
    header = list(map(float, lines[0].split()))
    min_year, max_year = header[-2], header[-1]
    
    # 解析年份行
    years = list(map(float, lines[1].split()))
    
    # 解析系数数据
    coefficients = []
    current_nm = None
    for line in lines[2:]:
        parts = line.split()
        n, m = int(parts[0]), int(parts[1])
        values = list(map(float, parts[2:]))
        
        if m == 0:
            coeff_type = 'g'
            coefficients.append((n, m, coeff_type, values))
            current_nm = None
        else:
            if current_nm == (n, m):
                coeff_type = 'h'
                coefficients.append((n, m, coeff_type, values))
                current_nm = None
            else:
                coeff_type = 'g'
                coefficients.append((n, m, coeff_type, values))
                current_nm = (n, m)
    
    # 计算最大阶数
    max_degree = max(n for n, _, _, _ in coefficients)
    
    return {
        'version': version,
        'degree': max_degree,
        'min_year': min_year,
        'max_year': max_year,
        'years': years,
        'coefficients': coefficients
    }

def generate_swift_model(model_data, output_dir):
    """生成单个Swift模型文件"""
    version = model_data['version']
    coeff_entries = []
    for coeff in model_data['coefficients']:
        n, m, c_type, values = coeff
        values_str = ', '.join(f'{v:.1f}' for v in values)
        entry = f'ASHCCoefficient(n: {n}, m: {m}, type: .{c_type}, values: [{values_str}])'
        coeff_entries.append(entry)
    
    swift_code = f"""//
//  SHCModel_{version}.swift
//

import Foundation

public extension ASHCModel {{
    static let model{version} = ASHCModel(
        version: {version},
        degree: {model_data['degree']},
        minYear: {model_data['min_year']},
        maxYear: {model_data['max_year']},
        years: {model_data['years']},
        coefficients: [
            {',\n            '.join(coeff_entries)}
        ]
    )
}}
"""
    output_path = os.path.join(output_dir, f'SHCModel_{version}.swift')
    with open(output_path, 'w', encoding='utf-8') as f:
        f.write(swift_code)

def generate_shc_definition(output_dir):
    """生成模型定义文件"""
    swift_code = """//
//
//  ASHCModel.swift
//
//  国际地磁参考场球谐系数模型
//

import Foundation

/// 球谐系数类型枚举
public enum ASHCCoefficientType: String, Codable, Hashable, Sendable {
    /// 高斯系数中的余弦项（Schmidt半归一化）
    case g
    /// 高斯系数中的正弦项（Schmidt半归一化）
    case h
}

/// 球谐系数数据单元
public struct ASHCCoefficient: Codable, Hashable, Sendable {
    /// 球谐函数阶数（degree），取值范围 1 ≤ n ≤ 模型最大阶数
    public let n: Int
    /// 球谐函数级数（order），取值范围 0 ≤ m ≤ n
    public let m: Int
    /// 系数类型（g或h），当m=0时只有g类型
    public let type: ASHCCoefficientType
    /// 按时间顺序排列的系数值数组（单位：nT或nT/年）
    /// 数组索引对应SHCModel.years中的年份顺序
    public let values: [Double]
}

/// 国际地磁参考场模型容器
public struct ASHCModel: Codable, Hashable, Sendable {
    /// 模型版本号（1-14对应1968-2020版本）
    public let version: Int
    /// 模型最大阶数（8或13）
    public let degree: Int
    /// 模型有效起始年份（含）
    public let minYear: Double
    /// 模型有效截止年份（含）
    public let maxYear: Double
    /// 模型包含的具体年份节点（十进制年表示）
    /// 例如：[1965.0, 1970.0, 1975.0]
    public let years: [Double]
    /// 包含所有球谐系数的数组
    public let coefficients: [ASHCCoefficient]

    /// 全版本模型集合（共14个版本）
    public static let all: [ASHCModel] = [
        .model1, .model2, .model3, .model4, .model5,
        .model6, .model7, .model8, .model9, .model10,
        .model11, .model12, .model13, .model14
    ]
}

"""
    with open(os.path.join(output_dir, 'ASHCModel.swift'), 'w', encoding='utf-8') as f:
        f.write(swift_code)

if __name__ == '__main__':
    input_dir = 'Sources/IGFRSwift/Resources/igrf_docs'
    output_dir = 'Sources/IGFRSwift/Resources/output_swift'
    os.makedirs(output_dir, exist_ok=True)
    
    # 生成基础定义文件
    generate_shc_definition(output_dir)
    
    # 遍历处理所有文档
    for v in range(1, 15):
        file_path = os.path.join(input_dir, f'IGRF{v}.txt')
        model_data = parse_igrf_file(file_path, v)
        generate_swift_model(model_data, output_dir)
