import Foundation

private let ratio = 180.0 / .pi

public struct SHCAngle: Codable, Sendable, Hashable, CustomStringConvertible {
    public var radians: Double

    public var degree: Double {
        get {
            radians * ratio
        }
        set {
            radians = newValue / ratio
        }
    }

    public init(radians: Double) {
        self.radians = radians
    }

    public init(degree: Double) {
        self.radians = degree / ratio
    }

    public func cos() -> Double {
        Foundation.cos(radians)
    }

    public func sin() -> Double {
        Foundation.sin(radians)
    }

    public func tan() -> Double {
        Foundation.tan(radians)
    }

    public static func acos(_ value: Double) -> SHCAngle {
        SHCAngle(radians: Foundation.acos(value))
    }

    public static func asin(_ value: Double) -> SHCAngle {
        SHCAngle(radians: Foundation.asin(value))
    }

    public static func atan(_ value: Double) -> SHCAngle {
        SHCAngle(radians: Foundation.atan(value))
    }

    public static func atan2(_ y: Double, _ x: Double) -> SHCAngle {
        SHCAngle(radians: Foundation.atan2(y, x))
    }

    public var description: String {
        "\(degree)°"
    }
}
