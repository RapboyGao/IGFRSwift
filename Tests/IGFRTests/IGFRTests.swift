@testable import IGFRSwift
import Testing

@Test func example() async throws {
    // Write your test here and use APIs like `#expect(...)` to check expected conditions.
    let result = try IGRFCalculator.calculate(latitude: 40, longitude: 116, altitude: 1, date: .now)
    print(result)
}
