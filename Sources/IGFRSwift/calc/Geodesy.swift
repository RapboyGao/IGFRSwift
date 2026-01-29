import Foundation

internal struct GeocentricCoordinates {
    let radius: Double
    let theta: Double
    let sinTheta: Double
    let cosTheta: Double
    let sinDelta: Double
    let cosDelta: Double
}

internal enum Geodesy {
    static let wgs84A = 6378.137
    static let wgs84B = 6356.7523142

    static func geocentricCoordinates(latitude: Double, longitude: Double, altitude: Double) -> GeocentricCoordinates {
        let latRad = latitude.degreesToRadians
        let sinLat = sin(latRad)
        let cosLat = cos(latRad)

        let a = wgs84A
        let b = wgs84B
        let e2 = (a * a - b * b) / (a * a)
        let n = a / sqrt(1.0 - e2 * sinLat * sinLat)

        let x = (n + altitude) * cosLat
        let z = (n * (1.0 - e2) + altitude) * sinLat

        let r = sqrt(x * x + z * z)
        let geocentricLat = atan2(z, x)
        let sinGeo = sin(geocentricLat)
        let cosGeo = cos(geocentricLat)

        let theta = Double.pi / 2.0 - geocentricLat
        let sinTheta = cosGeo
        let cosTheta = sinGeo

        let delta = latRad - geocentricLat
        let sinDelta = sin(delta)
        let cosDelta = cos(delta)

        return GeocentricCoordinates(
            radius: r,
            theta: theta,
            sinTheta: sinTheta,
            cosTheta: cosTheta,
            sinDelta: sinDelta,
            cosDelta: cosDelta
        )
    }
}
