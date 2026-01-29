import Foundation

public struct MagneticFieldResult: Sendable, Equatable {
    public let north: Double
    public let east: Double
    public let down: Double

    public init(north: Double, east: Double, down: Double) {
        self.north = north
        self.east = east
        self.down = down
    }

    public var horizontalIntensity: Double {
        sqrt(north * north + east * east)
    }

    public var totalIntensity: Double {
        sqrt(horizontalIntensity * horizontalIntensity + down * down)
    }

    public var declination: Double {
        atan2(east, north).radiansToDegrees
    }

    public var inclination: Double {
        atan2(down, horizontalIntensity).radiansToDegrees
    }
}
