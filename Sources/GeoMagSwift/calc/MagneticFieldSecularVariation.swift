import Foundation

public struct MagneticFieldSecularVariation: Sendable, Equatable {
    public let north: Double
    public let east: Double
    public let down: Double
    public let horizontalIntensity: Double
    public let totalIntensity: Double
    public let declinationArcMinutes: Double
    public let inclinationArcMinutes: Double
}
