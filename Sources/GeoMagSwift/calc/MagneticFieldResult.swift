import Foundation

/// 地磁场结果结构体，包含地磁场的各个分量及其派生量
/// Magnetic field result structure, containing various components of the magnetic field and their derived quantities
/// 
/// 该结构体表示地磁场在特定位置和时间的测量结果，包含三个基本分量（北向、东向和垂直向下）
/// 以及由此派生的水平强度、总强度、磁偏角和磁倾角。所有分量的单位均为纳特斯拉（nT），角度单位为度。
/// 
/// This structure represents the measurement result of the magnetic field at a specific location and time,
/// including three basic components (north, east, and vertical down) and derived quantities such as
/// horizontal intensity, total intensity, declination, and inclination. All components are in nanotesla (nT),
/// and angles are in degrees.
public struct MagneticFieldResult: Sendable, Equatable {
    /// 地磁场北向分量（纳特斯拉）
    /// 表示地磁场在地理北方向上的分量，正值指向北，负值指向南。
    /// North component of the magnetic field (nT)
    /// Represents the component of the magnetic field in the geographic north direction,
    /// positive values point north, negative values point south.
    public let north: Double
    
    /// 地磁场东向分量（纳特斯拉）
    /// 表示地磁场在地理东方向上的分量，正值指向东，负值指向西。
    /// East component of the magnetic field (nT)
    /// Represents the component of the magnetic field in the geographic east direction,
    /// positive values point east, negative values point west.
    public let east: Double
    
    /// 地磁场垂直向下分量（纳特斯拉）
    /// 表示地磁场在垂直向下方向上的分量，正值指向地心，负值指向天空。
    /// Down component of the magnetic field (nT)
    /// Represents the component of the magnetic field in the vertical down direction,
    /// positive values point toward the Earth's center, negative values point toward the sky.
    public let down: Double

    /// 初始化地磁场结果结构体
    /// Initialize magnetic field result structure
    /// - Parameters:
    ///   - north: 地磁场北向分量（纳特斯拉）
    ///   - north: North component of the magnetic field (nT)
    ///   - east: 地磁场东向分量（纳特斯拉）
    ///   - east: East component of the magnetic field (nT)
    ///   - down: 地磁场垂直向下分量（纳特斯拉）
    ///   - down: Down component of the magnetic field (nT)
    public init(north: Double, east: Double, down: Double) {
        self.north = north
        self.east = east
        self.down = down
    }

    /// 地磁场水平强度（纳特斯拉）
    /// 表示地磁场在水平方向上的强度，计算公式为：√(north² + east²)
    /// Horizontal intensity of the magnetic field (nT)
    /// Represents the intensity of the magnetic field in the horizontal direction,
    /// calculated as: √(north² + east²)
    public var horizontalIntensity: Double {
        sqrt(north * north + east * east)
    }

    /// 地磁场总强度（纳特斯拉）
    /// 表示地磁场的总强度，计算公式为：√(horizontalIntensity² + down²)
    /// Total intensity of the magnetic field (nT)
    /// Represents the total intensity of the magnetic field,
    /// calculated as: √(horizontalIntensity² + down²)
    public var totalIntensity: Double {
        sqrt(horizontalIntensity * horizontalIntensity + down * down)
    }

    /// 磁偏角（角度）
    /// 表示地磁场水平分量与地理正北方向的夹角，计算公式为：arctan2(east, north)
    /// 正值表示磁北在地理北以东，负值表示磁北在地理北以西。
    /// Declination of the magnetic field (degrees)
    /// Represents the angle between the horizontal component of the magnetic field and geographic north,
    /// calculated as: arctan2(east, north)
    /// Positive values indicate magnetic north is east of geographic north,
    /// negative values indicate magnetic north is west of geographic north.
    public var declination: SHCAngle {
        SHCAngle.atan2(east, north)
    }

    /// 磁倾角（角度）
    /// 表示地磁场总强度与水平方向的夹角，计算公式为：arctan2(down, horizontalIntensity)
    /// 正值表示磁场方向向下倾斜（北半球），负值表示磁场方向向上倾斜（南半球）。
    /// Inclination of the magnetic field (degrees)
    /// Represents the angle between the total magnetic field and the horizontal direction,
    /// calculated as: arctan2(down, horizontalIntensity)
    /// Positive values indicate the magnetic field direction dips downward (Northern Hemisphere),
    /// negative values indicate the magnetic field direction dips upward (Southern Hemisphere).
    public var inclination: SHCAngle {
        SHCAngle.atan2(down, horizontalIntensity)
    }
}
