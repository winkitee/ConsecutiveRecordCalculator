//
//  WeekRelationship.swift
//
//
//  Created by winkitee on 7/22/23.
//

import Foundation

enum WeekRelationship {
    case sameWeek
    case oneWeekApart
    case notConsecutive
    
    init(_ weeks: Int) {
        switch weeks {
        case 0:
            self = .sameWeek
        case 1:
            self = .oneWeekApart
        default:
            self = .notConsecutive
        }
    }
}
