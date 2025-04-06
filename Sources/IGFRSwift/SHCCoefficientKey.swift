import Foundation

public struct SHCCoefficientKey: Codable, Hashable, Sendable {
    public let n: Int
    public let m: Int
    public let type: SHCCoefficientType

    public init(n: Int, m: Int, type: SHCCoefficientType) {
        self.n = n
        self.m = m
        self.type = type
    }
}
