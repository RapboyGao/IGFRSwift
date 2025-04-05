import Foundation
import Numerics

/// 地磁场参数计算结果
/// 包含国际地磁参考场 (IGRF) 模型计算得出的全部磁场参数
/// 符合 Sendable, Codable 协议，支持并发安全和数据序列化
public struct GeomagneticResult: Sendable, Codable {
    // MARK: - 基础分量
    
    /// 北向磁场分量（单位：纳特斯拉 nT）
    /// 方向指向地理北，对应球坐标系中的 θ 分量
    public let x: Double
    
    /// 东向磁场分量（单位：纳特斯拉 nT）
    /// 方向指向地理东，对应球坐标系中的 φ 分量
    public let y: Double
    
    /// 垂直向下磁场分量（单位：纳特斯拉 nT）
    /// 方向垂直向下，对应球坐标系中的 r 分量
    public let z: Double
    
    // MARK: - 衍生参数
    
    public let totalIntensity: Double
    
    public let horizontalIntensity: Double
    
    public let inclination: Double
    
    public let declination: Double
}
