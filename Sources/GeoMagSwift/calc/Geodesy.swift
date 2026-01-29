import Foundation

/// 地心坐标系
/// Geocentric coordinates
internal struct GeocentricCoordinates {
    /// 半径
    /// Radius
    let radius: Double
    /// 极角
    /// Polar angle
    let theta: Double
    /// 极角正弦值
    /// Sine of polar angle
    let sinTheta: Double
    /// 极角余弦值
    /// Cosine of polar angle
    let cosTheta: Double
    /// 纬度差正弦值
    /// Sine of latitude difference
    let sinDelta: Double
    /// 纬度差余弦值
    /// Cosine of latitude difference
    let cosDelta: Double
}

/// 大地测量工具类
/// Geodesy utilities
internal enum Geodesy {
    /// WGS84椭球体长半轴（公里）
    /// WGS84 ellipsoid semi-major axis (km)
    static let wgs84A = 6378.137
    /// WGS84椭球体短半轴（公里）
    /// WGS84 ellipsoid semi-minor axis (km)
    static let wgs84B = 6356.7523142

    /// 计算地心坐标
    /// Calculate geocentric coordinates
    /// - Parameters:
    ///   - latitude: 纬度（度）
    ///   - latitude: Latitude (degrees)
    ///   - longitude: 经度（度）
    ///   - longitude: Longitude (degrees)
    ///   - altitude: 海拔高度（公里）
    ///   - altitude: Altitude (km)
    /// - Returns:
    ///   地心坐标结构体
    ///   Geocentric coordinates struct
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

        let delta = geocentricLat - latRad
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
