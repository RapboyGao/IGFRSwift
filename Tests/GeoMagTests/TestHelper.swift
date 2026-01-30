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

    func makeURL(latitude: Double, longitude: Double) -> URL {
        let latHem = latitude >= 0 ? "N" : "S"
        let lonHem = longitude >= 0 ? "E" : "W"
        let latAbs = abs(latitude)
        let lonAbs = abs(longitude)

        let calendar = Calendar(identifier: .gregorian)
        let components = calendar.dateComponents([.year, .month, .day], from: testDate)
        guard let year = components.year, let month = components.month, let day = components.day else {
            fatalError("Failed to extract date components")
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
            URLQueryItem(name: "elevation", value: "1"),
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
