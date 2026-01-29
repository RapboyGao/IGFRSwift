import Foundation

internal extension Double {
    var degreesToRadians: Double {
        self * .pi / 180.0
    }

    var radiansToDegrees: Double {
        self * 180.0 / .pi
    }
}
