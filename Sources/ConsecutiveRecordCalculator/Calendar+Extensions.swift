//
//  Calendar+Extensions.swift
//
//
//  Created by winkitee on 7/22/23.
//

import Foundation

extension Calendar {
    func startOfDay(for date: Date, from startTimeComponents: DateComponents) -> Date {
        let dateComponents = self.dateComponents(in: .current, from: date)
        
        // 시간 비교
        let isDateBeforeTimeString = dateComponents.hour! < startTimeComponents.hour! ||
        (dateComponents.hour! == startTimeComponents.hour! && dateComponents.minute! < startTimeComponents.minute!)
        
        var addingComponents = DateComponents()
        if isDateBeforeTimeString {
            addingComponents.day = -1 // 1일 빼기
        }
        // 지정된 시간으로 시작 시간 설정
        return startOfDay(for: Calendar.current.date(byAdding: addingComponents, to: date)!)
    }
}
