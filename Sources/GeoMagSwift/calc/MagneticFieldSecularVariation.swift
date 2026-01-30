import Foundation

/// 地磁场长期变化结构体，包含地磁场各分量的年变化率
/// Magnetic field secular variation structure, containing annual rates of change for various magnetic field components
///
/// 该结构体表示地磁场随时间的长期变化率，包含三个基本分量的变化率（北向、东向和垂直向下）
/// 以及由此派生的水平强度、总强度、磁偏角和磁倾角的变化率。磁场分量变化率的单位为纳特斯拉/年（nT/year），
/// 角度变化率的单位为角分/年（arc minutes/year）。
///
/// This structure represents the long-term rate of change of the magnetic field over time, including
/// annual rates of change for three basic components (north, east, and vertical down) and derived
/// quantities such as horizontal intensity, total intensity, declination, and inclination.
/// Magnetic field component rates are in nanotesla per year (nT/year), and angle rates are in
/// arc minutes per year (arc minutes/year).
public struct MagneticFieldSecularVariation: Sendable, Hashable, Codable {
    /// 地磁场北向分量的年变化率（纳特斯拉/年）
    /// 正值表示北向分量逐年增加，负值表示北向分量逐年减少。
    /// Annual rate of change of the north component of the magnetic field (nT/year)
    /// Positive values indicate the north component is increasing annually, negative values indicate it is decreasing.
    public let north: Double

    /// 地磁场东向分量的年变化率（纳特斯拉/年）
    /// 正值表示东向分量逐年增加，负值表示东向分量逐年减少。
    /// Annual rate of change of the east component of the magnetic field (nT/year)
    /// Positive values indicate the east component is increasing annually, negative values indicate it is decreasing.
    public let east: Double

    /// 地磁场垂直向下分量的年变化率（纳特斯拉/年）
    /// 正值表示垂直向下分量逐年增加，负值表示垂直向下分量逐年减少。
    /// Annual rate of change of the down component of the magnetic field (nT/year)
    /// Positive values indicate the down component is increasing annually, negative values indicate it is decreasing.
    public let down: Double

    /// 地磁场水平强度的年变化率（纳特斯拉/年）
    /// 正值表示水平强度逐年增加，负值表示水平强度逐年减少。
    /// Annual rate of change of the horizontal intensity of the magnetic field (nT/year)
    /// Positive values indicate the horizontal intensity is increasing annually, negative values indicate it is decreasing.
    public let horizontalIntensity: Double

    /// 地磁场总强度的年变化率（纳特斯拉/年）
    /// 正值表示总强度逐年增加，负值表示总强度逐年减少。
    /// Annual rate of change of the total intensity of the magnetic field (nT/year)
    /// Positive values indicate the total intensity is increasing annually, negative values indicate it is decreasing.
    public let totalIntensity: Double

    /// 磁偏角的年变化率（角度）
    /// 正值表示磁偏角逐年增加（磁北逐年东移），负值表示磁偏角逐年减少（磁北逐年西移）。
    /// Annual rate of change of the magnetic declination (angle)
    /// Positive values indicate the declination is increasing annually (magnetic north moving eastward),
    /// negative values indicate the declination is decreasing annually (magnetic north moving westward).
    public let declination: SHCAngle

    /// 磁倾角的年变化率（角度）
    /// 正值表示磁倾角逐年增加（磁场方向更倾向于垂直向下），负值表示磁倾角逐年减少（磁场方向更倾向于水平）。
    /// Annual rate of change of the magnetic inclination (angle)
    /// Positive values indicate the inclination is increasing annually (magnetic field direction becoming more vertical),
    /// negative values indicate the inclination is decreasing annually (magnetic field direction becoming more horizontal).
    public let inclination: SHCAngle

    /// 初始化地磁场长期变化结构体
    /// Initialize magnetic field secular variation structure
    /// - Parameters:
    ///   - mainField: 主磁场结果
    ///     - Main magnetic field result
    ///   - derivative: 导数分量 (north, east, down)
    ///     - Derivative components (north, east, down)
    public init(
        mainField: MagneticFieldResult,
        derivative: (north: Double, east: Double, down: Double)
    ) {
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

        let dDAngle = SHCAngle.radians(dD)
        let dIAngle = SHCAngle.radians(dI)

        self.north = dX
        self.east = dY
        self.down = dZ
        self.horizontalIntensity = dH
        self.totalIntensity = dF
        self.declination = dDAngle
        self.inclination = dIAngle
    }
}
