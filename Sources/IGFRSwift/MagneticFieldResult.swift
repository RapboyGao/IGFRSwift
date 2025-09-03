import Foundation

/// 磁场计算结果结构体
/// 用于存储和表示地磁场矢量的计算结果，包含XYZ分量和角度信息
public struct MagneticFieldResult: Codable, Hashable, Sendable, CustomStringConvertible {
    /// 磁场北向分量（X轴，单位：nT）
    public let x: Double
    
    /// 磁场东向分量（Y轴，单位：nT）
    public let y: Double
    
    /// 磁场垂直分量（Z轴，单位：nT）
    public let z: Double
    
    /// 磁场总强度（单位：nT）
    public var totalIntensity: Double {
        sqrt(x * x + y * y + z * z)
    }
    
    /// 磁倾角（inclination），磁场矢量与水平面的夹角（单位：度）
    /// 正值表示向下倾斜，负值表示向上倾斜
    public var inclination: Double {
        let horizontal = sqrt(x * x + y * y)
        return atan2(z, horizontal) * 180.0 / .pi
    }
    
    /// 磁偏角（declination），磁场水平分量与地理北向的夹角（单位：度）
    /// 正值表示向东偏转，负值表示向西偏转
    public var declination: Double {
        atan2(y, x) * 180.0 / .pi
    }
    
    /// 水平分量强度（单位：nT）
    public var horizontalIntensity: Double {
        sqrt(x * x + y * y)
    }
    
    /// 初始化方法
    /// - Parameters:
    ///   - x: 北向分量（nT）
    ///   - y: 东向分量（nT）
    ///   - z: 垂直分量（nT）
    public init(x: Double, y: Double, z: Double) {
        self.x = x
        self.y = y
        self.z = z
    }
    
    /// 自定义字符串描述
    public var description: String {
        String(format: """
            MagneticFieldResult:
            X (North): %.2f nT
            Y (East):  %.2f nT
            Z (Down):  %.2f nT
            Total Intensity: %.2f nT
            Inclination: %.2f°
            Declination: %.2f°
            Horizontal Intensity: %.2f nT
            """, x, y, z, totalIntensity, inclination, declination, horizontalIntensity)
    }
    
    /// 零磁场结果
    public static let zero = MagneticFieldResult(x: 0, y: 0, z: 0)
}