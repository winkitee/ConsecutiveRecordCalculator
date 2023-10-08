// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

public struct ConsecutiveRecordCalculator {
    public init() {
        
    }
    
    // MARK: - Days
    public func findMaxConsecutiveDays(dates: [Date], startOfDayTimeString: String) -> Int {
        guard !dates.isEmpty else {
            return 0
        }
        let sortedDates = dates.sorted()
        let startTimeComponents = getTimeComponents(from: startOfDayTimeString)
        
        var maxConsecutiveDays = 1
        var currentConsecutiveDays = 1
        
        for i in 1..<sortedDates.count {
            let currentDate = dates[i]
            let previousDate = dates[i-1]
            
            let daysBetween = daysBetween(previousDate, currentDate, startTimeComponents)
            switch DayRelationship(daysBetween) {
            case .sameDate:
                continue
            case .oneDayApart:
                currentConsecutiveDays += 1
                maxConsecutiveDays = max(maxConsecutiveDays, currentConsecutiveDays)
            case .notConsecutive:
                currentConsecutiveDays = 1
            }
        }
        
        return maxConsecutiveDays
    }
    
    public func findCurrentConsecutiveDays(dates: [Date], startOfDayTimeString: String) -> Int {
        guard !dates.isEmpty else {
            return 0
        }
        let sortedDates = dates.sorted()
        let startTimeComponents = getTimeComponents(from: startOfDayTimeString)
        
        var currentConsecutiveDays = 1
        
        for i in 1..<sortedDates.count {
            let currentDate = dates[i]
            let previousDate = dates[i-1]
            
            let daysBetween = daysBetween(previousDate, currentDate, startTimeComponents)
            switch DayRelationship(daysBetween) {
            case .sameDate:
                continue
            case .oneDayApart:
                currentConsecutiveDays += 1
            case .notConsecutive:
                return currentConsecutiveDays
            }
        }
        
        return currentConsecutiveDays
    }
    
    public func daysBetween(_ date1: Date, _ date2: Date, _ startTimeComponents: DateComponents) -> Int {
        let calendar = Calendar.current
        let startOfDate1 = calendar.startOfDay(for: date1, from: startTimeComponents)
        let startOfDate2 = calendar.startOfDay(for: date2, from: startTimeComponents)
        let components = calendar.dateComponents([.day], from: startOfDate1, to: startOfDate2)
        let daysBetween = components.day ?? 0
        return daysBetween
    }
    
    // MARK: - Weeks
    public func findMaxConsecutiveWeeks(dates: [Date], startOfDayTimeString: String) -> Int {
        let startTimeComponents = getTimeComponents(from: startOfDayTimeString)
        let sortedDates = dates.sorted()
        
        guard sortedDates.first != nil else {
            return 0
        }
        
        var maxConsecutiveWeeks = 1
        var currentConsecutiveWeeks = 1
        
        for i in 1..<sortedDates.count {
            let currentDate = sortedDates[i]
            let previousDate = sortedDates[i - 1]
            
            let weeksBetween = weeksBetween(previousDate, currentDate, startTimeComponents)
            switch WeekRelationship(weeksBetween) {
            case .sameWeek:
                continue
            case .oneWeekApart:
                currentConsecutiveWeeks += 1
                maxConsecutiveWeeks = max(maxConsecutiveWeeks, currentConsecutiveWeeks)
            case .notConsecutive:
                currentConsecutiveWeeks = 1
            }
        }
        
        return maxConsecutiveWeeks
    }
    
    public func findCurrentConsecutiveWeeks(dates: [Date], startOfDayTimeString: String) -> Int {
        let startTimeComponents = getTimeComponents(from: startOfDayTimeString)
        let sortedDates = dates.sorted()
        
        guard sortedDates.first != nil else {
            return 0
        }
        
        var currentConsecutiveWeeks = 1
        
        for i in 1..<sortedDates.count {
            let currentDate = sortedDates[i]
            let previousDate = sortedDates[i - 1]
            
            let weeksBetween = weeksBetween(previousDate, currentDate, startTimeComponents)
            switch WeekRelationship(weeksBetween) {
            case .sameWeek:
                continue
            case .oneWeekApart:
                currentConsecutiveWeeks += 1
            case .notConsecutive:
                return currentConsecutiveWeeks
            }
        }
        
        return currentConsecutiveWeeks
    }
    
    public func weeksBetween(_ date1: Date, _ date2: Date, _ startTimeComponents: DateComponents) -> Int {
        let calendar = Calendar.current
        let date1WithStartTime = calendar.startOfDay(for: date1, from: startTimeComponents)
        let date2WithStartTime = calendar.startOfDay(for: date2, from: startTimeComponents)
        let startOfWeekDate1 = calendar.date(from: calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: date1WithStartTime)) ?? date1
        let startOfWeekDate2 = calendar.date(from: calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: date2WithStartTime)) ?? date2
        let components = calendar.dateComponents([.weekOfYear], from: startOfWeekDate1, to: startOfWeekDate2)
        let weeksBetween = components.weekOfYear ?? 0
        return weeksBetween
    }
}
