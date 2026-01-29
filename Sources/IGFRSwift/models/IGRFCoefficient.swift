import Foundation

public struct IGRFCoefficient: Sendable, Equatable {
    public let n: Int
    public let m: Int
    public let kind: IGRFCoefficientKind
    public let values: [Double]

    public init(n: Int, m: Int, kind: IGRFCoefficientKind, values: [Double]) {
        self.n = n
        self.m = m
        self.kind = kind
        self.values = values
    }
}
