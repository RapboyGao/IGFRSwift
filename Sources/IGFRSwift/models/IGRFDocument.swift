import Foundation

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
