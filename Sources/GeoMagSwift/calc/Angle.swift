import Foundation

internal extension Double {
    /// 角度转换为弧度
    /// Degrees to radians conversion
    var degreesToRadians: Double {
        self / 57.29577951308232
    }

    /// 弧度转换为角度
    /// Radians to degrees conversion
    var radiansToDegrees: Double {
        self * 57.29577951308232
    }
}
