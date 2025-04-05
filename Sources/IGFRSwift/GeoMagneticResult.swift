import Foundation
import Numerics

/// 地磁场参数计算结果
/// 包含国际地磁参考场 (IGRF) 模型计算得出的全部磁场参数
/// 符合 Sendable, Codable 协议，支持并发安全和数据序列化
///
/// 数学模型基础：
/// 根据国际地磁与高空物理协会（IAGA）第13代IGRF模型规范，磁场标量势 V 展开为球谐函数：
/// $$
/// V(r,\theta,\phi,t) = a \sum_{n=1}^{13} \sum_{m=0}^{n} \left( \frac{a}{r} \right)^{n+1}
/// \left[ g_n^m(t) \cos(m\phi) + h_n^m(t) \sin(m\phi) \right] P_n^m(\cos\theta)
///
/// - a = 6371.2 km 为地球参考半径
/// - N = 13 为球谐展开最大阶数
/// - $g_n^m$ 和 $h_n^m$ 为时变高斯系数
/// - $P_n^m$ 为施密特准归一化缔合Legendre多项式
public struct GeomagneticResult: Sendable, Codable {
    // MARK: - 基础分量
    
    /// 北向磁场分量（单位：纳特斯拉 nT）
    /// 对应球坐标系中的 θ 分量计算：
    /// $ X = -\frac{1}{r} \frac{\partial V}{\partial \theta} $
    public let x: Double
    
    /// 东向磁场分量（单位：纳特斯拉 nT）
    /// 对应球坐标系中的 φ 分量计算：
    /// $ Y = \frac{1}{r \sin\theta} \frac{\partial V}{\partial \phi} $
    public let y: Double
    
    /// 垂直向下磁场分量（单位：纳特斯拉 nT）
    /// 对应球坐标系中的 r 分量计算：
    /// $ Z = -\frac{\partial V}{\partial r} $
    public let z: Double
    
    // MARK: - 衍生参数
    
    /// 总磁场强度（nT），计算公式：√(x² + y² + z²)
    public let totalIntensity: Double
    
    /// 水平磁场强度（nT），计算公式：√(x² + y²)
    public let horizontalIntensity: Double
    
    /// 磁倾角（度），磁场方向与水平面的夹角
    /// 计算式：arctan(z / H)
    public let inclination: Double
    
    /// 磁偏角（度），磁场方向与地理北的夹角
    /// 计算式：arctan(y / x)
    public let declination: Double

    public init(x: Double, y: Double, z: Double) {
        self.x = x
        self.y = y
        self.z = z
            
        // 计算水平强度（水平分量模）
        self.horizontalIntensity = sqrt(x * x + y * y)
            
        // 计算总磁场强度（三维矢量模）
        self.totalIntensity = sqrt(horizontalIntensity * horizontalIntensity + z * z)
            
        // 计算磁倾角（使用atan2处理象限和零值）
        // 注意：当水平分量为零时返回 ±π/2
        self.inclination = atan2(z, horizontalIntensity).toDegrees()
            
        // 计算磁偏角（使用atan2处理所有象限）
        // 当x=0且y≠0时返回正确的 π/2 或 -π/2
        // 当x=y=0时返回0（理论上此时磁偏角未定义）
        let declinationInRad = horizontalIntensity > 0 ? atan2(y, x) : 0.0
        self.declination = declinationInRad.toDegrees()
    }
}
