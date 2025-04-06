import Foundation

extension Date {
    /// 将日期转换为十进制年份（如2020.5表示2020年中的一半）
    var decimalYear: Double {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: self)
        guard let year = components.year else { return 0 }

        let yearStart = calendar.date(from: DateComponents(year: year, month: 1, day: 1))!
        let yearEnd = calendar.date(from: DateComponents(year: year + 1, month: 1, day: 1))!
        let yearDuration = yearEnd.timeIntervalSince(yearStart)
        let currentDuration = self.timeIntervalSince(yearStart)

        return Double(year) + currentDuration / yearDuration
    }
}
