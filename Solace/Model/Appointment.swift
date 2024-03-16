//
//  Appointment.swift
//  Solace
//
//  Created by Brandon Williams on 3/16/24.
//

import Foundation
import CoreLocation

struct Appointment: Hashable {
    let id: UUID
    let professional: ProfessionalView.Professional
    let user: UserView.User
    let date: Date
    let meeting: ProfessionalView.MeetingLocation
    
    var monthShort: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM"
        return dateFormatter.string(from: date)
    }
    
    var dayOfMonth: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd"
        return dateFormatter.string(from: date)
    }
}

let appointments: [Appointment] = []
