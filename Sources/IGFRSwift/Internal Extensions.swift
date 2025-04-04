import Foundation

internal extension Double {
    func toDegrees() -> Double {
        self * 57.29577951308232087679
    }
    func toRadians() -> Double {
        self / 57.29577951308232087679
    }
}
