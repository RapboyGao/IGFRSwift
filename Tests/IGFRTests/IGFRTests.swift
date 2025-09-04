@testable import IGFRSwift
import CoreLocation
import Testing

@Test func testMagneticField() async throws {
    // Write your test here and use APIs like `#expect(...)` to check expected conditions.
    let result = MagneticFieldResult(latitude: 40, longitude: 116, altitude: 0, north: 27708, east: -3599, up: 47378)
    print(result)
}

@Test func testIGRF001() async throws {
    let result = SHCModel.latest.calculate(CLLocation(latitude: 40, longitude: 116))
    print(result)
}
