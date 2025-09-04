import Foundation

// World Geodetic System 84 parameters:
private let WGS84_e2 = 0.00669437999014
private let WGS84_a = 6378.137  // km

extension SHCModel {
    public func isLeapYear(_ year: Int) -> Bool {
        (year % 4 == 0 && year % 100 != 0) || (year % 400 == 0)
    }

    public func dateToDecimalYear(_ date: Date) -> Double {
        let calendar = Calendar(identifier: .gregorian)
        let year = calendar.component(.year, from: date)
        guard let dayOfYear = calendar.ordinality(of: .day, in: .year, for: date),
              let daysInYearRange = calendar.range(of: .day, in: .year, for: date) else {
            return Double(year)
        }
        let daysInYear = daysInYearRange.count
        // 原逻辑已经通过 calendar.range(of:in:for:) 自动考虑了闰年情况，无需额外处理
        return Double(year) + Double(dayOfYear - 1) / Double(daysInYear)
    }
}
