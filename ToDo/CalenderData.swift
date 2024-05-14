import Foundation

struct CalendarData {
    var month: Int
    var year: Int

    var calendar = Calendar.current

    mutating func nextMonth() {
        month += 1
        if month > 12 {
            month = 1
            year += 1
        }
    }

    mutating func previousMonth() {
        month -= 1
        if month < 1 {
            month = 12
            year -= 1
        }
    }

    func monthString() -> String {
        let dateComponents = DateComponents(year: year, month: month)
        let date = calendar.date(from: dateComponents)!
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM yyyy"
        return dateFormatter.string(from: date)
    }

    func daysInMonth() -> [String] {
        var days = [String]()
        let dateComponents = DateComponents(year: year, month: month)
        let date = calendar.date(from: dateComponents)!
        let range = calendar.range(of: .day, in: .month, for: date)!
        
        for day in range {
            days.append(String(day))
        }
        return days
    }

    func dayOffset() -> Int {
        let dateComponents = DateComponents(year: year, month: month)
        let date = calendar.date(from: dateComponents)!
        let weekday = calendar.component(.weekday, from: date)
        return weekday - calendar.firstWeekday
    }
}

