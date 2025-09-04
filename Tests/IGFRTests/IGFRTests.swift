@testable import IGFRSwift
import Testing

@Test func example() async throws {
    // Write your test here and use APIs like `#expect(...)` to check expected conditions.
//    let result = try IGRFCalculator.calculate(latitude: 40, longitude: 116, altitude: 1, date: .now)
//    let model = SHCModel.model14
//    let result = model.calculateMagneticDeclination(longitude: 40, latitude: 116, altitude: 0, year: 2025)
//    print(result)
    let result = MagneticFieldResult(latitude: 40, longitude: 116, altitude: 0, north: 27708, east: -3599, up: 47378)
    print(result)
}
