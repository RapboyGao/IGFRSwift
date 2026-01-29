import Foundation

public enum IGRFCoefficientKind: String, Sendable, Equatable {
    case g
    case h
}

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

public struct IGRFDocument: Sendable, Equatable {
    public let fileName: String
    public let headers: [String]
    public let headerNumbers: [Double]
    public let epochs: [Double]
    public let coefficients: [IGRFCoefficient]

    public init(
        fileName: String,
        headers: [String],
        headerNumbers: [Double],
        epochs: [Double],
        coefficients: [IGRFCoefficient]
    ) {
        self.fileName = fileName
        self.headers = headers
        self.headerNumbers = headerNumbers
        self.epochs = epochs
        self.coefficients = coefficients
    }
}
