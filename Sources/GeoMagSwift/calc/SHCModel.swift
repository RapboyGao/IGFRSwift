import CoreLocation
import Foundation

/// 球谐系数模型，用于计算地磁场
/// Spherical Harmonic Coefficient model for calculating magnetic field
///
/// 该结构体表示一个完整的球谐系数模型，用于计算地球磁场。它包含模型的基本信息（如文件名、头部信息）、
/// 模型历元、球谐系数以及最大阶数。通过这些信息，模型可以计算任意位置和时间的地磁场值及其长期变化。
/// 该模型实现了Codable协议，支持序列化和反序列化，同时实现了Identifiable协议，便于在SwiftUI中使用。
///
/// This structure represents a complete spherical harmonic coefficient model for calculating the Earth's magnetic field.
/// It contains basic model information (such as file name, header information), model epochs,
/// spherical harmonic coefficients, and maximum order. Using this information, the model can calculate
/// magnetic field values and their secular variations at any location and time.
/// The model implements the Codable protocol for serialization and deserialization,
/// and the Identifiable protocol for easy use in SwiftUI.
public struct SHCModel: Sendable, Hashable, Codable, Identifiable {
    /// 模型文件名，用于唯一标识模型
    /// Model file name, used to uniquely identify the model
    public let fileName: String
    /// 模型头部信息，通常包含模型的元数据和描述
    /// Model header information, typically containing model metadata and descriptions
    public let headers: [String]
    /// 模型头部数字信息，通常包含模型的参数和配置值
    /// Model header numbers, typically containing model parameters and configuration values
    public let headerNumbers: [Double]
    /// 模型历元，即模型有效的时间点数组（十进制年份）
    /// Model epochs, an array of time points (decimal years) for which the model is valid
    public let epochs: [Double]
    /// 球谐系数数组，包含模型的所有高斯系数
    /// Array of spherical harmonic coefficients, containing all Gaussian coefficients of the model
    public let coefficients: [Coefficient]
    /// 模型的最大阶数，由系数数组中最大的n值决定
    /// Maximum order of the model, determined by the largest n value in the coefficient array
    public let nmax: Int

    /// 初始化球谐系数模型
    /// Initialize spherical harmonic coefficient model
    /// - Parameters:
    ///   - fileName: 模型文件名
    ///   - fileName: Model file name
    ///   - headers: 模型头部信息
    ///   - headers: Model header information
    ///   - headerNumbers: 模型头部数字信息
    ///   - headerNumbers: Model header numbers
    ///   - epochs: 模型历元数组
    ///   - epochs: Model epochs array
    ///   - coefficients: 球谐系数数组
    ///   - coefficients: Spherical harmonic coefficients array
    public init(
        fileName: String,
        headers: [String],
        headerNumbers: [Double],
        epochs: [Double],
        coefficients: [Coefficient]
    ) {
        self.fileName = fileName
        self.headers = headers
        self.headerNumbers = headerNumbers
        self.epochs = epochs
        self.coefficients = coefficients
        self.nmax = coefficients.map { $0.n }.max() ?? 0
    }

    /// 模型唯一标识符，使用文件名为ID
    /// Model unique identifier, using file name as ID
    public var id: String { fileName }

    /// 计算指定位置和日期的地磁场
    /// Calculate magnetic field at specified location and date
    /// - Parameters:
    ///   - location: 位置信息，包含经纬度和海拔高度
    ///   - location: Location information, including latitude, longitude, and altitude
    ///   - date: 日期，默认为当前日期
    ///   - date: Date, default is current date
    /// - Returns:
    ///   地磁场解，包含主磁场和长期变化信息
    ///   Magnetic field solution, containing main field and secular variation information
    public func calculate(
        _ location: CLLocation,
        date: Date = Date()
    ) -> MagneticFieldSolution {
        let year = DateUtils.decimalYear(from: date)
        return calculate(
            latitude: location.coordinate.latitude, longitude: location.coordinate.longitude,
            altitude: location.altitude / 1000.0, year: year)
    }

    /// 计算指定位置和日期的地磁场
    /// Calculate magnetic field at specified location and date
    /// - Parameters:
    ///   - latitude: 纬度（度）
    ///   - latitude: Latitude (degrees)
    ///   - longitude: 经度（度）
    ///   - longitude: Longitude (degrees)
    ///   - altitude: 海拔高度（公里）
    ///   - altitude: Altitude (km)
    ///   - year: 年份（十进制）
    ///   - year: Year (decimal)
    /// - Returns:
    ///   地磁场解，包含主磁场和长期变化信息
    ///   Magnetic field solution, containing main field and secular variation information
    public func calculate(latitude: Double, longitude: Double, altitude: Double, year: Date) -> MagneticFieldSolution {
        let year = DateUtils.decimalYear(from: year)
        return calculate(
            latitude: latitude, longitude: longitude,
            altitude: altitude, year: year)
    }

    /// 计算指定经纬度、海拔和年份的地磁场
    /// Calculate magnetic field at specified latitude, longitude, altitude and year
    /// - Parameters:
    ///   - latitude: 纬度（度）
    ///   - latitude: Latitude (degrees)
    ///   - longitude: 经度（度）
    ///   - longitude: Longitude (degrees)
    ///   - altitude: 海拔高度（公里）
    ///   - altitude: Altitude (km)
    ///   - year: 年份（十进制）
    ///   - year: Year (decimal)
    /// - Returns:
    ///   地磁场解，包含主磁场和长期变化信息
    ///   Magnetic field solution, containing main field and secular variation information
    public func calculate(
        latitude: Double,
        longitude: Double,
        altitude: Double,
        year: Double
    ) -> MagneticFieldSolution {
        let (g, h, gDot, hDot) = coefficients(for: year)
        let main = SphericalHarmonics.fieldComponents(
            nmax: nmax, g: g, h: h, latitude: latitude, longitude: longitude, altitude: altitude)
        let mainField = MagneticFieldResult(north: main.north, east: main.east, down: main.down)

        let secular = SphericalHarmonics.fieldComponents(
            nmax: nmax, g: gDot, h: hDot, latitude: latitude, longitude: longitude, altitude: altitude)
        let sec = makeSecularVariation(mainField: mainField, derivative: secular)

        return MagneticFieldSolution(mainField: mainField, secularVariation: sec)
    }

    /// 计算指定年份的球谐系数及其导数
    /// Calculate spherical harmonic coefficients and their derivatives for specified year
    /// - Parameter year: 年份（十进制）
    /// - Parameter year: Year (decimal)
    /// - Returns:
    ///   球谐系数及其导数的元组，包含g系数、h系数、g系数导数和h系数导数
    ///   Tuple of spherical harmonic coefficients and their derivatives, including g coefficients, h coefficients,
    ///   g coefficient derivatives, and h coefficient derivatives
    private func coefficients(for year: Double) -> (g: [[Double]], h: [[Double]], gDot: [[Double]], hDot: [[Double]]) {
        let size = nmax + 1
        var g = Array(repeating: Array(repeating: 0.0, count: size), count: size)
        var h = Array(repeating: Array(repeating: 0.0, count: size), count: size)
        var gDot = Array(repeating: Array(repeating: 0.0, count: size), count: size)
        var hDot = Array(repeating: Array(repeating: 0.0, count: size), count: size)

        guard epochs.count >= 2 else {
            return (g, h, gDot, hDot)
        }

        let (index, fraction) = interpolationParameters(for: year)
        let t0 = epochs[index]
        let t1 = epochs[index + 1]
        let dt = t1 - t0
        let invDt = dt != 0.0 ? 1.0 / dt : 0.0

        for coeff in coefficients {
            guard coeff.values.count > index + 1 else { continue }
            let v0 = coeff.values[index]
            let v1 = coeff.values[index + 1]
            let value = v0 + (v1 - v0) * fraction
            let derivative = (v1 - v0) * invDt

            if coeff.kind == .g {
                g[coeff.n][coeff.m] = value
                gDot[coeff.n][coeff.m] = derivative
            } else {
                h[coeff.n][coeff.m] = value
                hDot[coeff.n][coeff.m] = derivative
            }
        }

        return (g, h, gDot, hDot)
    }

    /// 计算插值参数，用于在两个历元之间插值
    /// Calculate interpolation parameters for interpolating between two epochs
    /// - Parameter year: 年份（十进制）
    /// - Parameter year: Year (decimal)
    /// - Returns:
    ///   插值索引和分数，索引表示使用哪两个历元进行插值，分数表示插值的权重
    ///   Interpolation index and fraction, where index indicates which two epochs to use for interpolation,
    ///   and fraction indicates the interpolation weight
    private func interpolationParameters(for year: Double) -> (index: Int, fraction: Double) {
        if epochs.count < 2 {
            return (0, 0.0)
        }
        if year <= epochs[0] {
            return (0, 0.0)
        }
        if year >= epochs[epochs.count - 1] {
            return (epochs.count - 2, 1.0)
        }
        var low = 0
        var high = epochs.count - 1
        while low + 1 < high {
            let mid = (low + high) / 2
            if year <= epochs[mid] {
                high = mid
            } else {
                low = mid
            }
        }
        let index = low
        let t0 = epochs[index]
        let t1 = epochs[index + 1]
        let fraction = t1 == t0 ? 0.0 : (year - t0) / (t1 - t0)
        return (index, fraction)
    }

    /// 计算地磁场长期变化
    /// Calculate magnetic field secular variation
    /// - Parameters:
    ///   - mainField: 主磁场结果
    ///   - mainField: Main magnetic field result
    ///   - derivative: 导数分量，包含北向、东向和垂直向下的导数
    ///   - derivative: Derivative components, including north, east, and down derivatives
    /// - Returns:
    ///   地磁场长期变化结果
    ///   Magnetic field secular variation result
    private func makeSecularVariation(
        mainField: MagneticFieldResult,
        derivative: (north: Double, east: Double, down: Double)
    ) -> MagneticFieldSecularVariation {
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

        let dDArcMin = SHCAngle.radians(dD).arcMinutes
        let dIArcMin = SHCAngle.radians(dI).arcMinutes

        return MagneticFieldSecularVariation(
            north: dX,
            east: dY,
            down: dZ,
            horizontalIntensity: dH,
            totalIntensity: dF,
            declination: SHCAngle(arcMinutes: dDArcMin),
            inclination: SHCAngle(arcMinutes: dIArcMin)
        )
    }
}

public extension SHCModel {
    /// 球谐系数类型枚举，表示高斯系数的类型
    /// Spherical harmonic coefficient kind enum, representing the type of Gaussian coefficient
    ///
    /// 该枚举定义了两种类型的球谐系数：g系数和h系数。这些系数是地磁场球谐模型的基本组成部分，
    /// 用于计算地球磁场的各个分量。
    ///
    /// This enum defines two types of spherical harmonic coefficients: g coefficients and h coefficients.
    /// These coefficients are fundamental components of the spherical harmonic model of the magnetic field,
    /// used to calculate various components of the Earth's magnetic field.
    enum CoefficientKind: String, Sendable, Hashable, Codable {
        /// 高斯g系数，用于计算地磁场的对称部分
        /// Gaussian g coefficient, used to calculate the symmetric part of the magnetic field
        case g
        /// 高斯h系数，用于计算地磁场的反对称部分
        /// Gaussian h coefficient, used to calculate the antisymmetric part of the magnetic field
        case h
    }

    /// 球谐系数结构体，表示单个球谐系数
    /// Spherical harmonic coefficient structure, representing a single spherical harmonic coefficient
    ///
    /// 该结构体表示一个球谐系数，包含阶数(n)、次数(m)、系数类型(kind)和系数值(values)。
    /// 系数值是一个数组，对应于模型的各个历元。通过这些信息，可以在不同时间点插值计算系数值，
    /// 从而得到任意时间的地磁场值。
    ///
    /// This structure represents a single spherical harmonic coefficient, including order (n),
    /// degree (m), coefficient kind, and coefficient values. The values array corresponds to
    /// the model's various epochs. Using this information, coefficient values can be interpolated
    /// at different time points to obtain magnetic field values at any time.
    struct Coefficient: Sendable, Hashable, Codable {
        /// 系数的阶数(n)，表示球谐函数的阶
        /// Coefficient order (n), representing the order of the spherical harmonic function
        public let n: Int
        /// 系数的次数(m)，表示球谐函数的次
        /// Coefficient degree (m), representing the degree of the spherical harmonic function
        public let m: Int
        /// 系数类型，表示是g系数还是h系数
        /// Coefficient kind, indicating whether it is a g coefficient or an h coefficient
        public let kind: CoefficientKind
        /// 系数值数组，对应于模型的各个历元
        /// Array of coefficient values, corresponding to the model's various epochs
        public let values: [Double]

        /// 初始化球谐系数
        /// Initialize spherical harmonic coefficient
        /// - Parameters:
        ///   - n: 系数的阶数
        ///   - n: Coefficient order
        ///   - m: 系数的次数
        ///   - m: Coefficient degree
        ///   - kind: 系数类型
        ///   - kind: Coefficient kind
        ///   - values: 系数值数组
        ///   - values: Array of coefficient values
        public init(n: Int, m: Int, kind: CoefficientKind, values: [Double]) {
            self.n = n
            self.m = m
            self.kind = kind
            self.values = values
        }
    }
}
