//
//  DayRelationship.swift
//
//
//  Created by winkitee on 7/22/23.
//

import Foundation

enum DayRelationship {
    case sameDate
    case oneDayApart
    case notConsecutive
    
    init(_ days: Int) {
        switch days {
        case 0:
            self = .sameDate
        case 1:
            self = .oneDayApart
        default:
            self = .notConsecutive
        }
    }
}
