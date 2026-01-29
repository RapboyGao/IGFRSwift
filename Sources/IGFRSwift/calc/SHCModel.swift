import CoreLocation
import Foundation

public struct SHCModel: Sendable, Hashable, Codable, Identifiable {
    public let fileName: String
    public let headers: [String]
    public let headerNumbers: [Double]
    public let epochs: [Double]
    public let coefficients: [Coefficient]
    public let nmax: Int

    public init(
        fileName: String,
        headers: [String],
        headerNumbers: [Double],
        epochs: [Double],
        coefficients: [Coefficient]
    ) {
        self.fileName = fileName
        self.headers = headers
        self.headerNumbers = headerNumbers
        self.epochs = epochs
        self.coefficients = coefficients
        self.nmax = coefficients.map { $0.n }.max() ?? 0
    }

    public var id: String { fileName }

    public func calculate(
        _ location: CLLocation,
        date: Date = Date()
    ) -> MagneticFieldSolution {
        let year = DateUtils.decimalYear(from: date)
        return calculate(
            latitude: location.coordinate.latitude, longitude: location.coordinate.longitude,
            altitude: location.altitude / 1000.0, year: year)
    }

    public func calculate(
        latitude: Double,
        longitude: Double,
        altitude: Double,
        year: Double
    ) -> MagneticFieldSolution {
        let (g, h, gDot, hDot) = coefficients(for: year)
        let main = SphericalHarmonics.fieldComponents(
            nmax: nmax, g: g, h: h, latitude: latitude, longitude: longitude, altitude: altitude)
        let mainField = MagneticFieldResult(north: main.north, east: main.east, down: main.down)

        let secular = SphericalHarmonics.fieldComponents(
            nmax: nmax, g: gDot, h: hDot, latitude: latitude, longitude: longitude, altitude: altitude)
        let sec = makeSecularVariation(mainField: mainField, derivative: secular)

        return MagneticFieldSolution(mainField: mainField, secularVariation: sec)
    }

    private func coefficients(for year: Double) -> (g: [[Double]], h: [[Double]], gDot: [[Double]], hDot: [[Double]]) {
        let size = nmax + 1
        var g = Array(repeating: Array(repeating: 0.0, count: size), count: size)
        var h = Array(repeating: Array(repeating: 0.0, count: size), count: size)
        var gDot = Array(repeating: Array(repeating: 0.0, count: size), count: size)
        var hDot = Array(repeating: Array(repeating: 0.0, count: size), count: size)

        guard epochs.count >= 2 else {
            return (g, h, gDot, hDot)
        }

        let (index, fraction) = interpolationParameters(for: year)
        let t0 = epochs[index]
        let t1 = epochs[index + 1]
        let dt = t1 - t0
        let invDt = dt != 0.0 ? 1.0 / dt : 0.0

        for coeff in coefficients {
            guard coeff.values.count > index + 1 else { continue }
            let v0 = coeff.values[index]
            let v1 = coeff.values[index + 1]
            let value = v0 + (v1 - v0) * fraction
            let derivative = (v1 - v0) * invDt

            if coeff.kind == .g {
                g[coeff.n][coeff.m] = value
                gDot[coeff.n][coeff.m] = derivative
            } else {
                h[coeff.n][coeff.m] = value
                hDot[coeff.n][coeff.m] = derivative
            }
        }

        return (g, h, gDot, hDot)
    }

    private func interpolationParameters(for year: Double) -> (index: Int, fraction: Double) {
        if epochs.count < 2 {
            return (0, 0.0)
        }
        if year <= epochs[0] {
            return (0, 0.0)
        }
        if year >= epochs[epochs.count - 1] {
            return (epochs.count - 2, 1.0)
        }
        var low = 0
        var high = epochs.count - 1
        while low + 1 < high {
            let mid = (low + high) / 2
            if year <= epochs[mid] {
                high = mid
            } else {
                low = mid
            }
        }
        let index = low
        let t0 = epochs[index]
        let t1 = epochs[index + 1]
        let fraction = t1 == t0 ? 0.0 : (year - t0) / (t1 - t0)
        return (index, fraction)
    }

    private func makeSecularVariation(
        mainField: MagneticFieldResult,
        derivative: (north: Double, east: Double, down: Double)
    ) -> MagneticFieldSecularVariation {
        let x = mainField.north
        let y = mainField.east
        let z = mainField.down
        let h = mainField.horizontalIntensity
        let f = mainField.totalIntensity

        let dX = derivative.north
        let dY = derivative.east
        let dZ = derivative.down

        let dH = (x * dX + y * dY) / h
        let dF = (x * dX + y * dY + z * dZ) / f
        let dD = (x * dY - y * dX) / (h * h)
        let dI = (h * dZ - z * dH) / (f * f)

        let dDArcMin = dD.radiansToDegrees * 60.0
        let dIArcMin = dI.radiansToDegrees * 60.0

        return MagneticFieldSecularVariation(
            north: dX,
            east: dY,
            down: dZ,
            horizontalIntensity: dH,
            totalIntensity: dF,
            declinationArcMinutes: dDArcMin,
            inclinationArcMinutes: dIArcMin
        )
    }
}

public extension SHCModel {
    enum CoefficientKind: String, Sendable, Hashable, Codable {
        case g
        case h
    }

    struct Coefficient: Sendable, Hashable, Codable {
        public let n: Int
        public let m: Int
        public let kind: CoefficientKind
        public let values: [Double]

        public init(n: Int, m: Int, kind: CoefficientKind, values: [Double]) {
            self.n = n
            self.m = m
            self.kind = kind
            self.values = values
        }
    }
}
