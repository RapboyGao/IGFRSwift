import CoreLocation
import Foundation
import Testing

@testable import GeoMagSwift

@Test func testIGRF14DeclinationMatchesNCEI() async throws {
    let config = MagneticModelTestConfig(
        modelName: "IGRF",
        localModel: SHCModel.igrf14,
        seed: 0x1A2B3C4D5E6F7788,
        maxErrorNT: 2.0
    )
    try await config.runTests()
}

@Test func testWMM2025DeclinationMatchesNCEI() async throws {
    let config = MagneticModelTestConfig(
        modelName: "WMM",
        localModel: SHCModel.wmm2025,
        seed: 0x0F1E2D3C4B5A6978,
        maxErrorNT: 2.0
    )
    try await config.runTests()
}

@Test func testWMMHR2025DeclinationMatchesNCEI() async throws {
    let config = MagneticModelTestConfig(
        modelName: "WMMHR",
        localModel: SHCModel.wmmhr2025,
        seed: 0x1234567890ABCDEF,
        maxErrorNT: 20.0
    )
    try await config.runTests()
}
