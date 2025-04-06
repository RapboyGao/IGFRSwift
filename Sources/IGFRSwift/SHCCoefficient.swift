import Foundation

/// 球谐系数数据单元
public struct SHCCoefficient: Codable, Hashable, Sendable {
    /// 球谐函数阶数（degree），取值范围 1 ≤ n ≤ 模型最大阶数
    public let n: Int
    /// 球谐函数级数（order），取值范围 0 ≤ m ≤ n
    public let m: Int
    /// 系数类型（g或h），当m=0时只有g类型
    public let type: SHCCoefficientType
    /// 按时间顺序排列的系数值数组（单位：nT或nT/年）
    /// 数组索引对应SHCModel.years中的年份顺序
    public let values: [Double]
}
