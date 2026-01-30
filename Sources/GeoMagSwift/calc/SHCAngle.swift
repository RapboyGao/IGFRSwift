import Foundation

private let radiansToDegrees = 57.29577951308232

public enum SHCAngle: Codable, Sendable, Hashable {
    case degrees(Double)
    case radians(Double)

    /// 从角度创建弧度角度
    /// Create a radians angle from degrees
    /// 这样后续的运算都基于弧度，可以提高运算效率
    /// 例如，sin(π/2) = 1，而 sin(90°) = 1，但是 sin(π/2) 是直接计算的，而 sin(90°) 是先转换为弧度再计算的
    /// 所以，后续的运算都基于弧度可以避免重复转换，提高效率
    public init(degrees: Double) {
        self = .degrees(degrees).toRadians()
    }

    public var radians: Double {
        switch self {
        case .degrees(let d):
            return d / radiansToDegrees
        case .radians(let r):
            return r
        }
    }

    public var degrees: Double {
        switch self {
        case .degrees(let d):
            return d
        case .radians(let r):
            return r * radiansToDegrees
        }
    }

    public func toRadians() -> Self {
        switch self {
        case .degrees(let d):
            return .radians(d / radiansToDegrees)
        case .radians:
            return self
        }
    }

    public var sin: Double {
        Foundation.sin(radians)
    }

    public var cos: Double {
        Foundation.cos(radians)
    }

    public var tan: Double {
        Foundation.tan(radians)
    }

    public var sinh: Double {
        Foundation.sinh(radians)
    }

    public var cosh: Double {
        Foundation.cosh(radians)
    }

    public var tanh: Double {
        Foundation.tanh(radians)
    }

    public static func asin(_ x: Double) -> Self {
        .radians(Foundation.asin(x))
    }

    public static func acos(_ x: Double) -> Self {
        .radians(Foundation.acos(x))
    }

    public static func atan(_ x: Double) -> Self {
        .radians(Foundation.atan(x))
    }

    public static func atan2(_ y: Double, _ x: Double) -> Self {
        .radians(Foundation.atan2(y, x))
    }
}
