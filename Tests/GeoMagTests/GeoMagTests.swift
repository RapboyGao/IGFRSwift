import CoreLocation
import Foundation
import Testing

@testable import GeoMagSwift

struct MagneticModelTestConfig {
    let modelName: String
    let localModel: SHCModel
    let seed: UInt64
    let testDate: Date
    let testCount: Int = 5
    let maxError: Double = 0.1

    init(modelName: String, localModel: SHCModel, seed: UInt64) {
        self.modelName = modelName
        self.localModel = localModel
        self.seed = seed
        
        let calendar = Calendar(identifier: .gregorian)
        guard let date = calendar.date(
            from: DateComponents(timeZone: TimeZone(secondsFromGMT: 0), year: 2026, month: 1, day: 29)) else {
            fatalError("Failed to create test date")
        }
        self.testDate = date
    }

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
            URLQueryItem(name: "model", value: modelName),
            URLQueryItem(name: "startYear", value: "2026"),
            URLQueryItem(name: "startMonth", value: "1"),
            URLQueryItem(name: "startDay", value: "29"),
            URLQueryItem(name: "endYear", value: "2026"),
            URLQueryItem(name: "endMonth", value: "1"),
            URLQueryItem(name: "endDay", value: "29"),
            URLQueryItem(name: "dateStepSize", value: "1.0"),
            URLQueryItem(name: "resultFormat", value: "json"),
        ]
        guard let url = components.url else {
            fatalError("Failed to create URL for model: \(modelName)")
        }
        return url
    }

    func runTests() async throws {
        var rng = SeededGenerator(state: seed)

        for _ in 0..<testCount {
            let latitude = randomDouble(in: -80.0...80.0, using: &rng)
            let longitude = randomDouble(in: -180.0...180.0, using: &rng)
            let url = makeURL(latitude: latitude, longitude: longitude)

            let (data, _) = try await URLSession.shared.data(from: url)
            let response = try JSONDecoder().decode(Response.self, from: data)
            guard let declination = response.result.first?.declination else {
                fatalError("Failed to get declination from API response")
            }

            let location = CLLocation(latitude: latitude, longitude: longitude)
            let result = localModel.calculate(location, date: testDate)
            #expect(abs(result.mainField.declination - declination) <= maxError)
        }
    }
}

@Test func testIGRF14DeclinationMatchesNCEI() async throws {
    let config = MagneticModelTestConfig(
        modelName: "IGRF",
        localModel: SHCModel.igrf14,
        seed: 0x1A2B3C4D5E6F7788
    )
    try await config.runTests()
}

@Test func testWMM2025DeclinationMatchesNCEI() async throws {
    let config = MagneticModelTestConfig(
        modelName: "WMM",
        localModel: SHCModel.wmm2025,
        seed: 0x0F1E2D3C4B5A6978
    )
    try await config.runTests()
}

@Test func testWMMHR2025DeclinationMatchesNCEI() async throws {
    let config = MagneticModelTestConfig(
        modelName: "WMMHR",
        localModel: SHCModel.wmmhr2025,
        seed: 0x1234567890ABCDEF
    )
    print("WMMHR 2025 Coefficients = ", config.localModel.coefficients.count)
    try await config.runTests()
}
