//
//  Date.swift
//  Solace
//
//  Created by Brandon Williams on 3/15/24.
//

import Foundation

extension Date {
    static var weekdaySymbolsWithDates: [(String, Int)] {
        let calendar = NSCalendar.current
        let currentDate = Date()
        let weekdays = calendar.veryShortWeekdaySymbols
        let weekdayIndex = calendar.component(.weekday, from: currentDate)
        
        var weekdayDates: [(String, Int)] = []
        
        for (index, weekday) in weekdays.enumerated() {
            let offset = (index + 1 - weekdayIndex)
            
            let date = calendar.date(byAdding: .day, value: offset, to: currentDate)!
            let dayNumber = calendar.component(.day, from: date) // Extract the day component
            weekdayDates.append((weekday, dayNumber))
        }
        
        return weekdayDates
    }
}
