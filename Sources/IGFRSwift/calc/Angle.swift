import Foundation

internal extension Double {
    var degreesToRadians: Double {
        self / 57.29577951308232
    }

    var radiansToDegrees: Double {
        self * 57.29577951308232
    }
}
