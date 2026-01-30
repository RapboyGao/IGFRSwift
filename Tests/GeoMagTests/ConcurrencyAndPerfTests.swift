import Foundation
import Testing

@testable import GeoMagSwift

@Test("并发计算结果一致")
func testConcurrentCalculateIsDeterministic() async throws {
    let model = SHCModel.wmm2025
    guard let minEpoch = model.epochs.min(), let maxEpoch = model.epochs.max() else {
        #expect(Bool(false), "Model epochs should not be empty")
        return
    }
    let midEpoch = (minEpoch + maxEpoch) / 2.0

    let latitude = 37.7749
    let longitude = -122.4194
    let altitude = 0.0

    let baseline = try model.calculate(latitude: latitude, longitude: longitude, altitude: altitude, year: midEpoch)

    let taskCount = 100
    try await withThrowingTaskGroup(of: MagneticFieldSolution.self) { group in
        for _ in 0..<taskCount {
            group.addTask {
                try model.calculate(latitude: latitude, longitude: longitude, altitude: altitude, year: midEpoch)
            }
        }

        var completed = 0
        for try await result in group {
            #expect(result == baseline)
            completed += 1
        }
        #expect(completed == taskCount)
    }
}

@Test("批量计算性能基线")
func testBatchPerformanceBaseline() throws {
    let model = SHCModel.wmm2025
    guard let minEpoch = model.epochs.min(), let maxEpoch = model.epochs.max() else {
        #expect(Bool(false), "Model epochs should not be empty")
        return
    }
    let midEpoch = (minEpoch + maxEpoch) / 2.0

    let iterations = 2000
    let maxMsEnv = ProcessInfo.processInfo.environment["GEOMAG_PERF_MAX_MS"]
    let maxMs = Double(maxMsEnv ?? "5000") ?? 5000

    let start = Date()
    var checksum = 0.0
    for i in 0..<iterations {
        let lat = (Double(i % 180) - 90.0) + 0.001
        let lon = (Double(i % 360) - 180.0) + 0.001
        let result = try model.calculate(latitude: lat, longitude: lon, altitude: 0.0, year: midEpoch)
        checksum += result.mainField.totalIntensity
    }
    let elapsedMs = Date().timeIntervalSince(start) * 1000.0

    #expect(checksum.isFinite)
    #expect(elapsedMs < maxMs, "Performance regression: \(elapsedMs)ms > \(maxMs)ms")
}
