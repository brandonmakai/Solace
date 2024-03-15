//
//  Calendar.swift
//  Solace
//
//  Created by Brandon Williams on 3/15/24.
//

import SwiftUI

struct RowCalendar: View {
    var body: some View {
        @State var daysOfWeek = Date.weekdaySymbolsWithDates
        VStack{
            VStack{
                HStack{
                    Text("TODAY")
                    ForEach(daysOfWeek, id: \.0) { weekday, date in
                        VStack{
                            Text(weekday)
                            Text("\(date)")
                        }
                    }
                }
                .foregroundColor(Color.secondary)
                .font(.caption)
                
            }
            
            .preferredColorScheme(.light)
        }
    }
}

#Preview {
    RowCalendar()
}
