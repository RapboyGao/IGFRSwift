import Foundation
import Testing

@testable import GeoMagSwift

@Test("超出模型有效期会抛错")
func testYearOutOfRangeThrows() throws {
    let model = SHCModel.wmm2025
    guard let minEpoch = model.epochs.min(), let maxEpoch = model.epochs.max() else {
        #expect(Bool(false), "Model epochs should not be empty")
        return
    }

    let latitude = 10.0
    let longitude = 20.0
    let altitude = 0.0

    do {
        _ = try model.calculate(latitude: latitude, longitude: longitude, altitude: altitude, year: minEpoch - 0.0001)
        #expect(Bool(false), "Expected out-of-range year to throw")
    } catch let error as SHCModel.SHCModelError {
        switch error {
        case .yearOutOfRange(let year, let range):
            #expect(year < range.lowerBound)
            #expect(range.lowerBound == minEpoch)
            #expect(range.upperBound == maxEpoch)
        case .noModelForYear:
            #expect(Bool(false), "Unexpected noModelForYear error")
        case .invalidEpochs:
            #expect(Bool(false), "Model epochs should be valid")
        }
    } catch {
        #expect(Bool(false), "Unexpected error: \(error)")
    }

    do {
        _ = try model.calculate(latitude: latitude, longitude: longitude, altitude: altitude, year: maxEpoch + 0.0001)
        #expect(Bool(false), "Expected out-of-range year to throw")
    } catch let error as SHCModel.SHCModelError {
        switch error {
        case .yearOutOfRange(let year, let range):
            #expect(year > range.upperBound)
            #expect(range.lowerBound == minEpoch)
            #expect(range.upperBound == maxEpoch)
        case .noModelForYear:
            #expect(Bool(false), "Unexpected noModelForYear error")
        case .invalidEpochs:
            #expect(Bool(false), "Model epochs should be valid")
        }
    } catch {
        #expect(Bool(false), "Unexpected error: \(error)")
    }
}

@Test("模型有效期边界可正常计算")
func testYearInRangeDoesNotThrow() throws {
    let model = SHCModel.wmm2025
    guard let minEpoch = model.epochs.min(), let maxEpoch = model.epochs.max() else {
        #expect(Bool(false), "Model epochs should not be empty")
        return
    }

    let latitude = 10.0
    let longitude = 20.0
    let altitude = 0.0

    _ = try model.calculate(latitude: latitude, longitude: longitude, altitude: altitude, year: minEpoch)
    _ = try model.calculate(latitude: latitude, longitude: longitude, altitude: altitude, year: maxEpoch)
}
