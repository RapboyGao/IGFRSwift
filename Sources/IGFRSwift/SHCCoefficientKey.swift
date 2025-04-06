import Foundation

public struct SHCCoefficientKey: Codable, Hashable, Sendable {
    /// 球谐函数阶数（degree），取值范围 1 ≤ n ≤ 模型最大阶数
    public let n: Int
    /// 系数类型（g或h），当m=0时只有g类型
    public let m: Int
    /// 球谐系数类型枚举
    public let type: SHCCoefficientType

    public init(n: Int, m: Int, type: SHCCoefficientType) {
        self.n = n
        self.m = m
        self.type = type
    }
}
