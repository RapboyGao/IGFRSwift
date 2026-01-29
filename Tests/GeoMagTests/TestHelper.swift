import Foundation

struct SeededGenerator: RandomNumberGenerator {
    var state: UInt64
    mutating func next() -> UInt64 {
        state = 6364136223846793005 &* state &+ 1
        return state
    }
}

struct Response: Decodable {
    struct Result: Decodable {
        let declination: Double
    }
    let result: [Result]
}

func randomDouble(in range: ClosedRange<Double>, using generator: inout SeededGenerator) -> Double {
    let value = Double(generator.next()) / Double(UInt64.max)
    return range.lowerBound + (range.upperBound - range.lowerBound) * value
}
