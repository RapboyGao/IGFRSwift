import Foundation

/// 地磁场解结构体，包含主磁场和长期变化的完整信息
/// Magnetic field solution structure, containing complete information about the main magnetic field and secular variation
///
/// 该结构体表示地磁场计算的完整结果，包含两个主要部分：主磁场（MagneticFieldResult）和长期变化（MagneticFieldSecularVariation）。
/// 主磁场部分提供了特定位置和时间的地磁场各分量的当前值，而长期变化部分提供了这些分量随时间的变化率。
/// 这种结构设计使得用户可以同时获取地磁场的当前状态和未来变化趋势的信息。
///
/// This structure represents the complete result of a magnetic field calculation, including two main parts:
/// the main magnetic field (MagneticFieldResult) and the secular variation (MagneticFieldSecularVariation).
/// The main field part provides the current values of various magnetic field components at a specific location and time,
/// while the secular variation part provides the rates of change of these components over time.
/// This structure design allows users to simultaneously obtain information about both the current state of the magnetic field
/// and its future change trends.
public struct MagneticFieldSolution: Sendable, Hashable, Codable {
    /// 主磁场结果
    /// 包含特定位置和时间的地磁场各分量的当前值，如北向、东向、垂直向下分量，以及派生的水平强度、总强度、磁偏角和磁倾角。
    /// Main magnetic field result
    /// Contains the current values of various magnetic field components at a specific location and time,
    /// such as north, east, and down components, as well as derived quantities like horizontal intensity,
    /// total intensity, declination, and inclination.
    public let mainField: MagneticFieldResult

    /// 地磁场长期变化
    /// 包含地磁场各分量的年变化率，如北向、东向、垂直向下分量的变化率，以及派生的水平强度、总强度、磁偏角和磁倾角的变化率。
    /// Magnetic field secular variation
    /// Contains the annual rates of change of various magnetic field components,
    /// such as rates for north, east, and down components, as well as derived quantities like
    /// horizontal intensity, total intensity, declination, and inclination rates.
    public let secularVariation: MagneticFieldSecularVariation
}
