//
//  SHCModel.swift
//
//  国际地磁参考场球谐系数模型
//

import Foundation

/// 球谐系数类型枚举
enum CoefficientType: String, Codable {
    /// 高斯系数中的余弦项（Schmidt半归一化）
    case g
    /// 高斯系数中的正弦项（Schmidt半归一化）
    case h
}

/// 球谐系数数据单元
struct Coefficient: Codable {
    /// 球谐函数阶数（degree），取值范围 1 ≤ n ≤ 模型最大阶数
    let n: Int
    /// 球谐函数级数（order），取值范围 0 ≤ m ≤ n
    let m: Int
    /// 系数类型（g或h），当m=0时只有g类型
    let type: CoefficientType
    /// 按时间顺序排列的系数值数组（单位：nT或nT/年）
    /// 数组索引对应SHCModel.years中的年份顺序
    let values: [Double]
}

/// 国际地磁参考场模型容器
struct SHCModel {
    /// 模型版本号（1-14对应1968-2020版本）
    let version: Int
    /// 模型最大阶数（8或13）
    let degree: Int
    /// 模型有效起始年份（含）
    let minYear: Double
    /// 模型有效截止年份（含）
    let maxYear: Double
    /// 模型包含的具体年份节点（十进制年表示）
    /// 例如：[1965.0, 1970.0, 1975.0]
    let years: [Double]
    /// 包含所有球谐系数的数组
    let coefficients: [Coefficient]

    /// 全版本模型集合（共14个版本）
    static let all: [SHCModel] = [
        .model1, .model2, .model3, .model4, .model5,
        .model6, .model7, .model8, .model9, .model10,
        .model11, .model12, .model13, .model14
    ]
}
