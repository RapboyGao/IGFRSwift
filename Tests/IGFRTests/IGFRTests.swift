@testable import IGFRSwift
import CoreLocation
import Foundation
import Testing

@Test func testMagneticFieldMatchesExample() async throws {
    let calendar = Calendar(identifier: .gregorian)
    let date = calendar.date(from: DateComponents(timeZone: TimeZone(secondsFromGMT: 0), year: 2026, month: 1, day: 29))
    #expect(date != nil)

    let location = CLLocation(latitude: 40, longitude: 116)
    let result = SHCModel.latest.calculate(location, date: date!)

    let main = result.mainField
    #expect(abs(main.north - 27695) <= 2.0)
    #expect(abs(main.east - (-3613)) <= 2.0)
    #expect(abs(main.down - 47422) <= 2.0)
    #expect(abs(main.horizontalIntensity - 27929) <= 2.0)
    #expect(abs(main.totalIntensity - 55036) <= 2.0)
    #expect(abs(main.declination - (-7.434)) <= 0.02)
    #expect(abs(main.inclination - 59.504) <= 0.02)

    let sv = result.secularVariation
    #expect(abs(sv.north - (-12.5)) <= 0.5)
    #expect(abs(sv.east - (-13.0)) <= 0.5)
    #expect(abs(sv.down - 40.9) <= 0.5)
    #expect(abs(sv.horizontalIntensity - (-10.7)) <= 0.5)
    #expect(abs(sv.totalIntensity - 29.8) <= 0.5)
    #expect(abs(sv.declinationArcMinutes - (-1.8)) <= 0.2)
    #expect(abs(sv.inclinationArcMinutes - 1.9) <= 0.2)
}
