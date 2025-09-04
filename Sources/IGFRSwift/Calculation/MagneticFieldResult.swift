import Foundation

/// 地磁计算结果模型（兼容macOS 10.15+）
public struct MagneticFieldResult: CustomStringConvertible, Codable, Sendable, Hashable {
    // MARK: - 地理坐标

    /// 纬度（十进制度数，范围：-90° ~ 90°）
    public let latitude: Double
    /// 经度（十进制度数，范围：-180° ~ 180°）
    public let longitude: Double
    /// 海拔高度（米，WGS84坐标系）
    public let altitude: Double

    // MARK: - 磁场分量

    /// 北向强度（nT，正北方向）
    public let north: Double
    /// 东向强度（nT，正东方向）
    public let east: Double
    /// 垂直强度（nT，向下为正）
    public let up: Double

    // MARK: - 计算属性

    /// 总强度（nT）
    public var totalIntensity: Double {
        sqrt(north * north + east * east + up * up)
    }

    /// 磁偏角（度，东偏为正）
    public var declination: SHCAngle {
        .atan2(east, north)
    }

    /// 磁倾角（度，向下为正）
    public var inclination: SHCAngle {
        let horizontal = sqrt(north * north + east * east)
        return .atan2(up, horizontal)
    }

    // 协议实现
    public var description: String {
        """
        地磁计算结果：
        坐标：(\(latitude)°, \(longitude)°) \(altitude)m
        磁场分量：X=\(north)nT Y=\(east)nT Z=\(up)nT
        总强度：\(String(format: "%.1f", totalIntensity))nT
        偏角：\(declination)
        倾角：\(inclination)
        """
    }

    // MARK: - Initialization

    public init(
        latitude: Double,
        longitude: Double,
        altitude: Double,
        north: Double,
        east: Double,
        up: Double
    ) {
        self.latitude = latitude
        self.longitude = longitude
        self.altitude = altitude
        self.north = north
        self.east = east
        self.up = up
    }
}
