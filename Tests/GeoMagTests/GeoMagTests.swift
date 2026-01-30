import CoreLocation
import Foundation
import Testing

@testable import GeoMagSwift

@Test func testIGRF14DeclinationMatchesNCEI() async throws {

    func makeURL(latitude: Double, longitude: Double) -> URL {
        let latHem = latitude >= 0 ? "N" : "S"
        let lonHem = longitude >= 0 ? "E" : "W"
        let latAbs = abs(latitude)
        let lonAbs = abs(longitude)

        var components = URLComponents()
        components.scheme = "https"
        components.host = "www.ngdc.noaa.gov"
        components.path = "/geomag-web/calculators/calculateIgrfwmm"
        components.queryItems = [
            URLQueryItem(name: "browserRequest", value: "true"),
            URLQueryItem(name: "key", value: "EAU2y"),
            URLQueryItem(name: "lat1", value: String(format: "%.6f", latAbs)),
            URLQueryItem(name: "lat1Hemisphere", value: latHem),
            URLQueryItem(name: "lon1", value: String(format: "%.6f", lonAbs)),
            URLQueryItem(name: "lon1Hemisphere", value: lonHem),
            URLQueryItem(name: "coordinateSystem", value: "M"),
            URLQueryItem(name: "elevation", value: "1"),
            URLQueryItem(name: "elevationUnits", value: "K"),
            URLQueryItem(name: "model", value: "IGRF"),
            URLQueryItem(name: "startYear", value: "2026"),
            URLQueryItem(name: "startMonth", value: "1"),
            URLQueryItem(name: "startDay", value: "29"),
            URLQueryItem(name: "endYear", value: "2026"),
            URLQueryItem(name: "endMonth", value: "1"),
            URLQueryItem(name: "endDay", value: "29"),
            URLQueryItem(name: "dateStepSize", value: "1.0"),
            URLQueryItem(name: "resultFormat", value: "json"),
        ]
        return components.url!
    }

    let calendar = Calendar(identifier: .gregorian)
    let date = calendar.date(
        from: DateComponents(timeZone: TimeZone(secondsFromGMT: 0), year: 2026, month: 1, day: 29))!
    var rng = SeededGenerator(state: 0x1A2B3C4D5E6F7788)

    for _ in 0..<5 {
        let latitude = randomDouble(in: -80.0...80.0, using: &rng)
        let longitude = randomDouble(in: -180.0...180.0, using: &rng)
        let url = makeURL(latitude: latitude, longitude: longitude)

        let (data, _) = try await URLSession.shared.data(from: url)
        let response = try JSONDecoder().decode(Response.self, from: data)
        let declination = response.result.first?.declination
        #expect(declination != nil)

        let location = CLLocation(latitude: latitude, longitude: longitude)
        let result = SHCModel.igrf14.calculate(location, date: date)
        #expect(abs(result.mainField.declination - declination!) <= 0.1)
    }
}

@Test func testWMM2025DeclinationMatchesNCEI() async throws {

    func makeURL(latitude: Double, longitude: Double) -> URL {
        let latHem = latitude >= 0 ? "N" : "S"
        let lonHem = longitude >= 0 ? "E" : "W"
        let latAbs = abs(latitude)
        let lonAbs = abs(longitude)

        var components = URLComponents()
        components.scheme = "https"
        components.host = "www.ngdc.noaa.gov"
        components.path = "/geomag-web/calculators/calculateIgrfwmm"
        components.queryItems = [
            URLQueryItem(name: "browserRequest", value: "true"),
            URLQueryItem(name: "key", value: "EAU2y"),
            URLQueryItem(name: "lat1", value: String(format: "%.6f", latAbs)),
            URLQueryItem(name: "lat1Hemisphere", value: latHem),
            URLQueryItem(name: "lon1", value: String(format: "%.6f", lonAbs)),
            URLQueryItem(name: "lon1Hemisphere", value: lonHem),
            URLQueryItem(name: "coordinateSystem", value: "M"),
            URLQueryItem(name: "elevation", value: "1"),
            URLQueryItem(name: "elevationUnits", value: "K"),
            URLQueryItem(name: "model", value: "WMM"),
            URLQueryItem(name: "startYear", value: "2026"),
            URLQueryItem(name: "startMonth", value: "1"),
            URLQueryItem(name: "startDay", value: "29"),
            URLQueryItem(name: "endYear", value: "2026"),
            URLQueryItem(name: "endMonth", value: "1"),
            URLQueryItem(name: "endDay", value: "29"),
            URLQueryItem(name: "dateStepSize", value: "1.0"),
            URLQueryItem(name: "resultFormat", value: "json"),
        ]
        return components.url!
    }

    let calendar = Calendar(identifier: .gregorian)
    let date = calendar.date(
        from: DateComponents(timeZone: TimeZone(secondsFromGMT: 0), year: 2026, month: 1, day: 29))!
    var rng = SeededGenerator(state: 0x0F1E2D3C4B5A6978)

    for _ in 0..<5 {
        let latitude = randomDouble(in: -80.0...80.0, using: &rng)
        let longitude = randomDouble(in: -180.0...180.0, using: &rng)
        let url = makeURL(latitude: latitude, longitude: longitude)

        let (data, _) = try await URLSession.shared.data(from: url)
        let response = try JSONDecoder().decode(Response.self, from: data)
        let declination = response.result.first?.declination
        #expect(declination != nil)

        let location = CLLocation(latitude: latitude, longitude: longitude)
        let result = SHCModel.wmm2025.calculate(location, date: date)
        #expect(abs(result.mainField.declination - declination!) <= 0.1)
    }
}

@Test func testWMMHR2025DeclinationMatchesNCEI() async throws {

    func makeURL(latitude: Double, longitude: Double) -> URL {
        let latHem = latitude >= 0 ? "N" : "S"
        let lonHem = longitude >= 0 ? "E" : "W"
        let latAbs = abs(latitude)
        let lonAbs = abs(longitude)

        var components = URLComponents()
        components.scheme = "https"
        components.host = "www.ngdc.noaa.gov"
        components.path = "/geomag-web/calculators/calculateIgrfwmm"
        components.queryItems = [
            URLQueryItem(name: "browserRequest", value: "true"),
            URLQueryItem(name: "key", value: "EAU2y"),
            URLQueryItem(name: "lat1", value: String(format: "%.6f", latAbs)),
            URLQueryItem(name: "lat1Hemisphere", value: latHem),
            URLQueryItem(name: "lon1", value: String(format: "%.6f", lonAbs)),
            URLQueryItem(name: "lon1Hemisphere", value: lonHem),
            URLQueryItem(name: "coordinateSystem", value: "M"),
            URLQueryItem(name: "elevation", value: "1"),
            URLQueryItem(name: "elevationUnits", value: "K"),
            URLQueryItem(name: "model", value: "WMMHR"),
            URLQueryItem(name: "startYear", value: "2026"),
            URLQueryItem(name: "startMonth", value: "1"),
            URLQueryItem(name: "startDay", value: "29"),
            URLQueryItem(name: "endYear", value: "2026"),
            URLQueryItem(name: "endMonth", value: "1"),
            URLQueryItem(name: "endDay", value: "29"),
            URLQueryItem(name: "dateStepSize", value: "1.0"),
            URLQueryItem(name: "resultFormat", value: "json"),
        ]
        return components.url!
    }

    let calendar = Calendar(identifier: .gregorian)
    let date = calendar.date(
        from: DateComponents(timeZone: TimeZone(secondsFromGMT: 0), year: 2026, month: 1, day: 29))!
    var rng = SeededGenerator(state: 0x1234567890ABCDEF)
    let model = SHCModel.wmmhr2025
    print("WMMHR 2025 Coefficients = ", model.coefficients.count)

    for _ in 0..<5 {
        let latitude = randomDouble(in: -80.0...80.0, using: &rng)
        let longitude = randomDouble(in: -180.0...180.0, using: &rng)
        let url = makeURL(latitude: latitude, longitude: longitude)

        let (data, _) = try await URLSession.shared.data(from: url)
        let response = try JSONDecoder().decode(Response.self, from: data)
        let declination = response.result.first?.declination
        #expect(declination != nil)

        let location = CLLocation(latitude: latitude, longitude: longitude)
        let result = model.calculate(location, date: date)
        #expect(abs(result.mainField.declination - declination!) <= 0.1)
    }
}
