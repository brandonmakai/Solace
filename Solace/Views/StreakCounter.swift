//
//  StreakCounter.swift
//  Solace
//
//  Created by Brandon Williams on 3/15/24.
//

import SwiftUI

class DayCounter: ObservableObject {
    @Published var daysPassed: Int = 0
    private let userDefaultsKey = "DayCounterStartDate"
    private var timer: Timer?
    
    init() {
        loadStartDate()
        startTimer()
    }
    
    deinit {
        timer?.invalidate()
    }
    
    func reset() {
        daysPassed = 0
        UserDefaults.standard.removeObject(forKey: userDefaultsKey)
        startTimer()
    }
    
    private func loadStartDate() {
        if let startDate = UserDefaults.standard.object(forKey: userDefaultsKey) as? Date {
            let calendar = NSCalendar.current
            let currentDate = Date()
            let components = calendar.dateComponents([.day], from: startDate, to: currentDate)
            if let days = components.day {
                daysPassed = days
            } else {
                UserDefaults.standard.set(Date(), forKey: userDefaultsKey)
            }
        }
    }
    
    private func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 24 * 60 * 60, repeats: true) { [weak self] _ in
            self?.daysPassed += 1}
    }
    
}
