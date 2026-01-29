import Foundation

public struct MagneticFieldSolution: Sendable, Equatable {
    public let mainField: MagneticFieldResult
    public let secularVariation: MagneticFieldSecularVariation
}
