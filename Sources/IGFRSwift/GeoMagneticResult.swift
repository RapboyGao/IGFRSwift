import Numerics
import Foundation
/// 地磁场参数计算结果
/// 包含国际地磁参考场 (IGRF) 模型计算得出的全部磁场参数
/// 符合 Sendable, Codable 协议，支持并发安全和数据序列化
public struct GeomagneticResult: Sendable, Codable {
    // MARK: - 基础分量
    
    /// 北向磁场分量（单位：纳特斯拉 nT）
    /// 方向指向地理北，对应球坐标系中的 θ 分量
    /// 从图片公式中的 X = -∂V/∂θ 计算得出
    public let x: Double
    
    /// 东向磁场分量（单位：纳特斯拉 nT）
    /// 方向指向地理东，对应球坐标系中的 φ 分量
    /// 从图片公式中的 Y = -1/(r sinθ) ∂V/∂φ 计算得出
    public let y: Double
    
    /// 垂直向下磁场分量（单位：纳特斯拉 nT）
    /// 方向垂直向下，对应球坐标系中的 r 分量
    /// 从图片公式中的 Z = -∂V/∂r 计算得出
    public let z: Double
    
    // MARK: - 衍生参数
    
    /// 总磁场强度（单位：纳特斯拉 nT）
    /// 计算方式：√(x² + y² + z²)
    /// 对应图片模型中向量模的计算
    public var totalIntensity: Double { sqrt(x*x + y*y + z*z) }
    
    /// 水平磁场强度（单位：纳特斯拉 nT）
    /// 计算方式：√(x² + y²)
    /// 用于磁偏角计算的基础参数
    public var horizontalIntensity: Double { sqrt(x*x + y*y) }
    
    /// 磁倾角（单位：度°，范围：-90° 到 90°）
    /// 磁场方向与水平面的夹角，向下为正
    /// 计算方式：arctan(z / horizontalIntensity)
    /// 当水平强度 < 1e-5 nT 时返回 ±90°
    public let inclination: Double
    
    /// 磁偏角（单位：度°，范围：-180° 到 180°）
    /// 磁场水平分量与地理北的夹角，东偏为正
    /// 计算方式：arctan(y / x)
    /// 当水平强度 < 1e-5 nT 时定义为无效值（返回 NaN）
    public let declination: Double
    
}
