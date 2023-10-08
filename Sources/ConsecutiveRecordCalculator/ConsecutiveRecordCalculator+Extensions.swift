//
//  ConsecutiveRecordCalculator+Extensions.swift
//
//
//  Created by winkitee on 7/22/23.
//

import Foundation

extension ConsecutiveRecordCalculator {
    public func getTimeComponents(from timeString: String) -> DateComponents {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        
        let date = dateFormatter.date(from: timeString) ?? Date()
        
        let calendar = Calendar.current
        let components = calendar.dateComponents([.hour, .minute], from: date)
        
        return components
    }
    
    public func date(year: Int, month: Int, day: Int, hour: Int = 0) -> Date {
        var components = DateComponents()
        components.year = year
        components.month = month
        components.day = day
        components.hour = hour
        let calendar = Calendar.current
        return calendar.date(from: components) ?? Date()
    }
    
    public func startDate(for date: Date, timeString: String) -> Date {
        let calendar = Calendar.current
        let timeComponents = getTimeComponents(from: timeString)
        let startOfDate = calendar.startOfDay(for: date, from: timeComponents)
        return startOfDate
    }
    
    public func endDate(for date: Date, timeString: String) -> Date {
        let start = startDate(for: date, timeString: timeString)
        return start.addingTimeInterval(24 * 60 * 60)
    }
    
    /// `startDate`와 `endDate`를 모두 반환하는 Tuple 함수
    public func dateRange(for date: Date, timeString: String) -> (startDate: Date, endDate: Date) {
        let start = startDate(for: date, timeString: timeString)
        let end = endDate(for: date, timeString: timeString)
        return (start, end)
    }
    
}
