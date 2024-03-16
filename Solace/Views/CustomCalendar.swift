//
//  CustomCalendar.swift
//  Solace
//
//  Created by Brandon Williams on 3/16/24.
//

import SwiftUI

struct CustomCalendar: View {
    let days = ["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"]
    @State var selectedMonth = 0
    @State var selectedDate = Date()
    
    var body: some View {
        VStack {
            Image(systemName: "calendar")
                .resizable()
                .scaledToFit()
                .frame(width: 128, height: 128)
                .cornerRadius(64)
            
            Text("Calendly Course")
                .font(.title)
                .bold()
            
            Rectangle()
                .frame(height: 1)
                .foregroundColor(.gray)
            
            VStack(spacing: 20) {
                Text("Select a Day")
                    .font(.title2)
                    .bold()
                
                // Month Selection
                HStack {
                    Spacer()
                    
                    Button {
                        withAnimation {
                            selectedMonth -= 1
                        }
                    } label: {
                        Image(systemName: "chevron.left")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 20, height: 32)
                            .foregroundColor(.gray)
                    }
                    
                    Spacer()
                    
                    Text(selectedDate.monthAndYear())
                        .font(.title2)
                    
                    Spacer()
                    
                    Button {
                        withAnimation {
                            selectedMonth += 1
                        }
                    } label: {
                        Image(systemName: "chevron.right")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 20, height: 32)
                            .foregroundColor(.gray)
                    }
                    
                    Spacer()
                }
                
                HStack {
                    ForEach(days, id: \.self) { day in
                        Text(day)
                            .font(.system(size: 12, weight: .medium))
                            .frame(maxWidth: .infinity)
                    }
                }
                
                LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 7), spacing: 20) {
                    ForEach(fetchDates()) { value in
                        ZStack {
                            if value.day != -1 {
                                Text("\(value.day)")
                                    .foregroundColor(value.day % 2 != 0 ? .blue : .black)
                                    .fontWeight(value.day % 2 != 0 ? .bold : .none)
                                    .background(
                                        ZStack(alignment: .bottom) {
                                            Circle()
                                                .frame(width: 48, height: 48)
                                                .foregroundColor(value.day % 2 != 0 ? .blue.opacity(0.1) : .clear)
                                            
                                            if value.date.string() == Date().string() {
                                                Circle()
                                                    .frame(width: 8, height: 8)
                                                    .foregroundColor(value.day % 2 != 0 ? .blue : .gray)
                                            }
                                        }
                                    )
                            } else {
                                Text("")
                            }
                        }
                        .frame(width: 32, height: 32)
                    }
                }
                .padding()
            }
            .onChange(of: selectedMonth) { _ in
                selectedDate = fetchSelectedMonth()
            }
        }
    }
    
    func fetchDates() -> [CalendarDate] {
        let calendar = Calendar.current
        let currentMonth = fetchSelectedMonth()
        
        var datesOfMonth = currentMonth.datesOfMonth().prefix(31).map { date in
            CalendarDate(day: calendar.component(.day, from: date), date: date)
        }
        
        let firstDayOfWeek = calendar.component(.weekday, from: datesOfMonth.first?.date ?? Date())
        
        for _ in 1 ..< firstDayOfWeek {
            datesOfMonth.insert(CalendarDate(day: -1, date: Date()), at: 0)
        }
        
        return datesOfMonth
    }
    
    func fetchSelectedMonth() -> Date {
        let calendar = Calendar.current
        
        let month = calendar.date(byAdding: .month, value: selectedMonth, to: Date()) ?? Date()
        return month
    }
}

struct CalendarDate: Identifiable {
    let id = UUID()
    var day: Int
    var date: Date
}

#Preview {
        CustomCalendar()
}

extension Date {
    func monthAndYear() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM YYYY"
        
        return formatter.string(from: self)
    }
    
    func datesOfMonth() -> [Date] {
        let calendar = Calendar.current
        let currentMonth = calendar.component(.month, from: self)
        let currentYear = calendar.component(.year, from: self)
        
        var startDateComponents = DateComponents()
        startDateComponents.year = currentYear
        startDateComponents.month = currentMonth
        startDateComponents.day = 1
        let startDate = calendar.date(from: startDateComponents)!
        
        var endDateComponents = DateComponents()
        endDateComponents.month = currentMonth + 1
        endDateComponents.day = 0 // Set to 0 to get the last day of the previous month
        let endDate = calendar.date(byAdding: endDateComponents, to: startDate)!
        
        var dates: [Date] = []
        var currentDate = startDate
        
        while currentDate <= endDate {
            dates.append(currentDate)
            currentDate = calendar.date(byAdding: .day, value: 1, to: currentDate)!
        }
        
        return dates
    }
    
    func string() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"
        return formatter.string(from: self)
    }
}
