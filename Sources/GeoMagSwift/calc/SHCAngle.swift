import Foundation

/// 弧度到角度的转换因子
/// Radians to degrees conversion factor
private let radiansToDegrees = 57.29577951308232

/// 角度到角分的转换因子
/// Degrees to arc minutes conversion factor
private let degreesToArcMinutes = 60.0

/// 角度类型枚举，表示不同单位的角度
/// Angle type enum, representing angles in different units
///
/// 该枚举表示三种不同单位的角度：度、弧度和角分。它提供了角度单位之间的转换方法，
/// 以及角度的三角函数计算。通过这种方式，可以在不同单位之间方便地转换角度，
/// 同时保持计算的一致性和效率。
///
/// This enum represents angles in three different units: degrees, radians, and arc minutes.
/// It provides methods for converting between angle units and calculating trigonometric functions of angles.
/// This allows for convenient conversion between different units while maintaining consistent and efficient calculations.
public enum SHCAngle: Codable, Sendable, Hashable {
    /// 以度为单位的角度
    /// Angle in degrees
    case degrees(Double)

    /// 以弧度为单位的角度
    /// Angle in radians
    case radians(Double)

    /// 以角分为单位的角度
    /// Angle in arc minutes
    case arcMinutes(Double)

    /// 从角度创建弧度角度
    /// Create a radians angle from degrees
    ///
    /// 这样后续的运算都基于弧度，可以提高运算效率
    /// 例如，sin(π/2) = 1，而 sin(90°) = 1，但是 sin(π/2) 是直接计算的，而 sin(90°) 是先转换为弧度再计算的
    /// 所以，后续的运算都基于弧度可以避免重复转换，提高效率
    ///
    /// This initializer creates a radians angle from degrees, so subsequent operations are based on radians,
    /// which can improve computational efficiency. For example, sin(π/2) = 1, and sin(90°) = 1,
    /// but sin(π/2) is calculated directly, while sin(90°) is first converted to radians and then calculated.
    /// Therefore, subsequent operations based on radians can avoid repeated conversions and improve efficiency.
    ///
    /// - Parameter degrees: 角度值
    ///     - Angle in degrees
    public init(degrees: Double) {
        self = .degrees(degrees).toRadians()
    }

    /// 从角分创建弧度角度
    /// Create a radians angle from arc minutes
    ///
    /// 这样后续的运算都基于弧度，可以提高运算效率
    /// This initializer creates a radians angle from arc minutes, so subsequent operations are based on radians,
    /// which can improve computational efficiency.
    ///
    /// - Parameter arcMinutes: 角分值
    ///     - Angle in arc minutes
    public init(arcMinutes: Double) {
        self = .arcMinutes(arcMinutes).toRadians()
    }

    /// 获取角度的弧度值
    /// Get the angle in radians
    ///
    /// 无论当前角度是什么单位，都返回其对应的弧度值
    /// Returns the corresponding radians value regardless of the current angle unit
    public var radians: Double {
        switch self {
        case .degrees(let d):
            return d / radiansToDegrees
        case .radians(let r):
            return r
        case .arcMinutes(let m):
            return (m / degreesToArcMinutes) / radiansToDegrees
        }
    }

    /// 获取角度的度数值
    /// Get the angle in degrees
    ///
    /// 无论当前角度是什么单位，都返回其对应的度数值
    /// Returns the corresponding degrees value regardless of the current angle unit
    public var degrees: Double {
        switch self {
        case .degrees(let d):
            return d
        case .radians(let r):
            return r * radiansToDegrees
        case .arcMinutes(let m):
            return m / degreesToArcMinutes
        }
    }

    /// 获取角度的角分值
    /// Get the angle in arc minutes
    ///
    /// 无论当前角度是什么单位，都返回其对应的角分值
    /// Returns the corresponding arc minutes value regardless of the current angle unit
    public var arcMinutes: Double {
        switch self {
        case .degrees(let d):
            return d * degreesToArcMinutes
        case .radians(let r):
            return r * radiansToDegrees * degreesToArcMinutes
        case .arcMinutes(let m):
            return m
        }
    }

    /// 将角度转换为弧度单位
    /// Convert the angle to radians
    ///
    /// - Returns: 转换后的弧度角度
    /// - Returns: Converted angle in radians
    public func toRadians() -> Self {
        switch self {
        case .degrees(let d):
            return .radians(d / radiansToDegrees)
        case .radians:
            return self
        case .arcMinutes(let m):
            return .radians((m / degreesToArcMinutes) / radiansToDegrees)
        }
    }

    /// 将角度转换为角分单位
    /// Convert the angle to arc minutes
    ///
    /// - Returns: 转换后的角分角度
    /// - Returns: Converted angle in arc minutes
    public func toArcMinutes() -> Self {
        switch self {
        case .degrees, .radians:
            return .arcMinutes(arcMinutes)
        case .arcMinutes:
            return self
        }
    }

    /// 计算角度的正弦值
    /// Calculate the sine of the angle
    ///
    /// - Returns: 角度的正弦值
    /// - Returns: Sine of the angle
    public var sin: Double {
        Foundation.sin(radians)
    }

    /// 计算角度的余弦值
    /// Calculate the cosine of the angle
    ///
    /// - Returns: 角度的余弦值
    /// - Returns: Cosine of the angle
    public var cos: Double {
        Foundation.cos(radians)
    }

    /// 计算角度的正切值
    /// Calculate the tangent of the angle
    ///
    /// - Returns: 角度的正切值
    /// - Returns: Tangent of the angle
    public var tan: Double {
        Foundation.tan(radians)
    }

    /// 计算角度的双曲正弦值
    /// Calculate the hyperbolic sine of the angle
    ///
    /// - Returns: 角度的双曲正弦值
    /// - Returns: Hyperbolic sine of the angle
    public var sinh: Double {
        Foundation.sinh(radians)
    }

    /// 计算角度的双曲余弦值
    /// Calculate the hyperbolic cosine of the angle
    ///
    /// - Returns: 角度的双曲余弦值
    /// - Returns: Hyperbolic cosine of the angle
    public var cosh: Double {
        Foundation.cosh(radians)
    }

    /// 计算角度的双曲正切值
    /// Calculate the hyperbolic tangent of the angle
    ///
    /// - Returns: 角度的双曲正切值
    /// - Returns: Hyperbolic tangent of the angle
    public var tanh: Double {
        Foundation.tanh(radians)
    }

    /// 计算反正弦值
    /// Calculate the arc sine value
    ///
    /// - Parameter x: 正弦值，范围为[-1, 1]
    ///     - Sine value, range [-1, 1]
    /// - Returns: 对应的角度（弧度）
    /// - Returns: Corresponding angle (in radians)
    public static func asin(_ x: Double) -> Self {
        .radians(Foundation.asin(x))
    }

    /// 计算反余弦值
    /// Calculate the arc cosine value
    ///
    /// - Parameter x: 余弦值，范围为[-1, 1]
    ///     - Cosine value, range [-1, 1]
    /// - Returns: 对应的角度（弧度）
    /// - Returns: Corresponding angle (in radians)
    public static func acos(_ x: Double) -> Self {
        .radians(Foundation.acos(x))
    }

    /// 计算反正切值
    /// Calculate the arc tangent value
    ///
    /// - Parameter x: 正切值
    ///     - Tangent value
    /// - Returns: 对应的角度（弧度），范围为[-π/2, π/2]
    /// - Returns: Corresponding angle (in radians), range [-π/2, π/2]
    public static func atan(_ x: Double) -> Self {
        .radians(Foundation.atan(x))
    }

    /// 计算两数比值的反正切值
    /// Calculate the arc tangent of the ratio of two numbers
    ///
    /// - Parameter y: 分子
    ///     - Numerator
    /// - Parameter x: 分母
    ///     - Denominator
    /// - Returns: 对应的角度（弧度），范围为[-π, π]
    /// - Returns: Corresponding angle (in radians), range [-π, π]
    public static func atan2(_ y: Double, _ x: Double) -> Self {
        .radians(Foundation.atan2(y, x))
    }
}
