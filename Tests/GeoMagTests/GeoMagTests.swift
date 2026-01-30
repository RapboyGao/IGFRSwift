import CoreLocation
import Foundation
import Testing

@testable import GeoMagSwift

@Test("测试 IGRF14 模型的磁偏角计算结果与 NCEI 数据匹配")
func testIGRF14DeclinationMatchesNCEI() async throws {
    let config = MagneticModelTestConfig(
        modelName: "IGRF",
        localModel: SHCModel.igrf14,
        seed: 0x1A2B3C4D5E6F7788,
        maxErrorNT: 2.0
    )
    try await config.runTests()
}

@Test("测试 WMM2025 模型的磁偏角计算结果与 NCEI 数据匹配")
func testWMM2025DeclinationMatchesNCEI() async throws {
    let config = MagneticModelTestConfig(
        modelName: "WMM",
        localModel: SHCModel.wmm2025,
        seed: 0x0F1E2D3C4B5A6978,
        maxErrorNT: 2.0
    )
    try await config.runTests()
}

@Test("测试 WMMHR2025 模型的磁偏角计算结果与 NCEI 数据匹配")
func testWMMHR2025DeclinationMatchesNCEI() async throws {
    let config = MagneticModelTestConfig(
        modelName: "WMMHR",
        localModel: SHCModel.wmmhr2025,
        seed: 0x1234567890ABCDEF,
        maxErrorNT: 25
    )
    try await config.runTests()
}

@Test("测试所有 SHCModel 模型是否正确加载（非空数据）")
func testAllSHCModelsAreProperlyLoaded() {
    let allModels: [SHCModel] = [
        .wmm2025,
        .wmm2020,
        .wmm2015,
        .wmm2010,
        .wmmhr2025,
        .igrf14,
        .igrf13,
        .igrf12,
        .igrf11,
        .igrf10,
    ]

    for model in allModels {
        // 检查模型文件名不为空
        #expect(!model.fileName.isEmpty)
        // 检查模型系数不为空
        #expect(!model.coefficients.isEmpty)
        // 检查模型最大阶数大于0
        #expect(model.nmax > 0)
        // 检查模型历元不为空
        #expect(!model.epochs.isEmpty)
    }
}
