//  SHCModel.swift
//  国际地磁参考场球谐系数模型
import Foundation

/// 国际地磁参考场模型容器
public struct SHCModel: Codable, Hashable, Sendable {
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
    public let coefficients: [SHCCoefficient]
}
