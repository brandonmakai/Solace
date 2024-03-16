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
                                .font(.system(size: 25))
                        }
                    }
                }
                .foregroundColor(Color.secondary)
                .font(.headline)
                
            }
            
            .preferredColorScheme(.light)
        }
    }
}

#Preview {
    RowCalendar()
}
