import CoreLocation
import Foundation
import Testing

@testable import GeoMagSwift

enum MagneticModelTestError: Error, CustomStringConvertible {
    case invalidDate
    case invalidURL(String)
    case emptyResult(String)

    var description: String {
        switch self {
        case .invalidDate:
            return "Failed to extract date components"
        case .invalidURL(let model):
            return "Failed to create URL for model: \(model)"
        case .emptyResult(let model):
            return "Failed to get result from API response for model: \(model)"
        }
    }
}

struct MagneticModelTestConfig {
    let modelName: String
    let localModel: SHCModel
    let seed: UInt64
    let testDate: Date
    let testCount: Int = 5
    let maxErrorDegrees: Double = 0.1
    let maxErrorNT: Double = 1.0
    let maxErrorArcMin: Double = 0.2

    init(modelName: String, localModel: SHCModel, seed: UInt64, testDate: Date? = nil) {
        self.modelName = modelName
        self.localModel = localModel
        self.seed = seed

        if let providedDate = testDate {
            self.testDate = providedDate
        } else {
            // Use current date as default
            self.testDate = Date()
        }
    }

    func makeURL(latitude: Double, longitude: Double) throws -> URL {
        let latHem = latitude >= 0 ? "N" : "S"
        let lonHem = longitude >= 0 ? "E" : "W"
        let latAbs = abs(latitude)
        let lonAbs = abs(longitude)

        let calendar = Calendar(identifier: .gregorian)
        let components = calendar.dateComponents([.year, .month, .day], from: testDate)
        guard let year = components.year, let month = components.month, let day = components.day else {
            throw MagneticModelTestError.invalidDate
        }

        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "www.ngdc.noaa.gov"
        urlComponents.path = "/geomag-web/calculators/calculateIgrfwmm"
        urlComponents.queryItems = [
            URLQueryItem(name: "browserRequest", value: "true"),
            URLQueryItem(name: "key", value: "EAU2y"),
            URLQueryItem(name: "lat1", value: String(format: "%.6f", latAbs)),
            URLQueryItem(name: "lat1Hemisphere", value: latHem),
            URLQueryItem(name: "lon1", value: String(format: "%.6f", lonAbs)),
            URLQueryItem(name: "lon1Hemisphere", value: lonHem),
            URLQueryItem(name: "coordinateSystem", value: "M"),
            URLQueryItem(name: "elevation", value: "0"),
            URLQueryItem(name: "elevationUnits", value: "K"),
            URLQueryItem(name: "model", value: modelName),
            URLQueryItem(name: "startYear", value: String(year)),
            URLQueryItem(name: "startMonth", value: String(month)),
            URLQueryItem(name: "startDay", value: String(day)),
            URLQueryItem(name: "endYear", value: String(year)),
            URLQueryItem(name: "endMonth", value: String(month)),
            URLQueryItem(name: "endDay", value: String(day)),
            URLQueryItem(name: "dateStepSize", value: "1.0"),
            URLQueryItem(name: "resultFormat", value: "json"),
        ]
        guard let url = urlComponents.url else {
            throw MagneticModelTestError.invalidURL(modelName)
        }
        return url
    }

    func runTests() async throws {
        var rng = SeededGenerator(state: seed)

        for _ in 0..<testCount {
            let latitude = randomDouble(in: -80.0...80.0, using: &rng)
            let longitude = randomDouble(in: -180.0...180.0, using: &rng)
            let url = try makeURL(latitude: latitude, longitude: longitude)

            let (data, _) = try await URLSession.shared.data(from: url)
            let response = try JSONDecoder().decode(Response.self, from: data)

            guard let api = response.result.first else {
                throw MagneticModelTestError.emptyResult(modelName)
            }

            let location = CLLocation(latitude: latitude, longitude: longitude)

            let result = localModel.calculate(location, date: testDate)
            #expect(abs(result.mainField.declination - api.declination) <= maxErrorDegrees)
            #expect(abs(result.mainField.inclination - api.inclination) <= maxErrorDegrees)
            #expect(abs(result.mainField.north - api.xcomponent) <= maxErrorNT)
            #expect(abs(result.mainField.east - api.ycomponent) <= maxErrorNT)
            #expect(abs(result.mainField.down - api.zcomponent) <= maxErrorNT)
            #expect(abs(result.mainField.horizontalIntensity - api.horintensity) <= maxErrorNT)
            #expect(abs(result.mainField.totalIntensity - api.totalintensity) <= maxErrorNT)

            let sv = result.secularVariation
            #expect(abs(sv.north - api.xcomponent_sv) <= maxErrorNT)
            #expect(abs(sv.east - api.ycomponent_sv) <= maxErrorNT)
            #expect(abs(sv.down - api.zcomponent_sv) <= maxErrorNT)
            #expect(abs(sv.horizontalIntensity - api.horintensity_sv) <= maxErrorNT)
            #expect(abs(sv.totalIntensity - api.totalintensity_sv) <= maxErrorNT)
            #expect(abs(sv.declinationArcMinutes - api.declination_sv * 60.0) <= maxErrorArcMin)
            #expect(abs(sv.inclinationArcMinutes - api.inclination_sv * 60.0) <= maxErrorArcMin)
        }
    }
}

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
        let inclination: Double
        let xcomponent: Double
        let ycomponent: Double
        let zcomponent: Double
        let horintensity: Double
        let totalintensity: Double
        let declination_sv: Double
        let inclination_sv: Double
        let xcomponent_sv: Double
        let ycomponent_sv: Double
        let zcomponent_sv: Double
        let horintensity_sv: Double
        let totalintensity_sv: Double
    }
    let result: [Result]
}

func randomDouble(in range: ClosedRange<Double>, using generator: inout SeededGenerator) -> Double {
    let value = Double(generator.next()) / Double(UInt64.max)
    return range.lowerBound + (range.upperBound - range.lowerBound) * value
}
