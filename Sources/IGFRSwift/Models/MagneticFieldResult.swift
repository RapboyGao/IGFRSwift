import Foundation



/// 地磁计算结果模型（兼容macOS 10.15+）
public struct MagneticFieldResult: CustomStringConvertible, Codable, Sendable, Hashable {
    // MARK: - Nested Types
    public struct SecularVariation: Codable, Sendable, Hashable {
        public let totalIntensitySV: Double
        public let declinationSV: Double
        public let inclinationSV: Double
        public let northIntensitySV: Double
        public let eastIntensitySV: Double
        public let verticalIntensitySV: Double
        public let horizontalIntensitySV: Double
    }

    // MARK: - Properties
    // MARK: - 地理坐标
    /// 纬度（十进制度数，范围：-90° ~ 90°）
    public let latitude: Double
    /// 经度（十进制度数，范围：-180° ~ 180°）
    public let longitude: Double
    /// 海拔高度（米，WGS84坐标系）
    public let altitude: Double

    // MARK: - 磁场分量
    /// 北向强度（nT，正北方向）
    public let x: Double
    /// 东向强度（nT，正东方向）
    public let y: Double
    /// 垂直强度（nT，向下为正）
    public let z: Double

    // MARK: - 时间信息
    /// 计算时间（UTC时区）
    public let calculationDate: Date

    // MARK: - 长期变化
    /// 地磁场年变率参数
    public let secularVariation: SecularVariation

    // MARK: - 计算属性
    /// 总强度（nT）
    public var totalIntensity: Double {
        sqrt(x * x + y * y + z * z)
    }

    /// 磁偏角（度，东偏为正）
    public var declination: Double {
        atan2(y, x) * 180.0 / .pi
    }

    /// 磁倾角（度，向下为正）
    public var inclination: Double {
        let horizontal = sqrt(x * x + y * y)
        return atan2(z, horizontal) * 180.0 / .pi
    }

    // 日期格式化工具
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return formatter
    }

    // 协议实现
    public var description: String {
        """
        地磁计算结果：
        坐标：(\(latitude)°, \(longitude)°) \(altitude)m
        磁场分量：X=\(x)nT Y=\(y)nT Z=\(z)nT
        总强度：\(String(format: "%.1f", totalIntensity))nT
        偏角：\(String(format: "%.2f", declination))°
        倾角：\(String(format: "%.2f", inclination))°
        长期变化：\(String(format: "%.2f", secularVariation.totalIntensitySV))nT/年, \(String(format: "%.2f", secularVariation.declinationSV))°/年, \(String(format: "%.2f", secularVariation.inclinationSV))°/年
        计算时间：\(dateFormatter.string(from: calculationDate))
        """
    }

    

        // MARK: - Initialization
    public init(
        latitude: Double,
        longitude: Double,
        altitude: Double,
        x: Double,
        y: Double,
        z: Double,
        secularVariation: SecularVariation,
        calculationDate: Date = Date()
    ) {
        precondition((-90...90).contains(latitude), "纬度范围错误")
        precondition((-180...180).contains(longitude), "经度范围错误")
        precondition(x >= 0 && y >= 0 && z >= 0, "磁场强度不可为负")
        self.latitude = latitude
        self.longitude = longitude
        self.altitude = altitude
        self.x = x
        self.y = y
        self.z = z
        self.secularVariation = secularVariation
        self.calculationDate = calculationDate
    }
}


/// 年变率参数
public struct MagneticSecularVariation: Codable, Sendable, Hashable {
    /// 总强度年变率（nT/年）
    public let totalIntensitySV: Double
    /// 磁偏角年变率（度/年，东偏为正）
    public let declinationSV: Double
    /// 磁倾角年变率（度/年，向下为正）
    public let inclinationSV: Double
    /// 北向强度年变率（nT/年）
    public let northIntensitySV: Double
    /// 东向强度年变率（nT/年）
    public let eastIntensitySV: Double
    /// 垂直强度年变率（nT/年）
    public let verticalIntensitySV: Double
    /// 水平强度年变率（nT/年）
    public let horizontalIntensitySV: Double
}
