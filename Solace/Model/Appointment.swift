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

// Create some sample professionals
let professional1 = ProfessionalView.Professional(id: UUID(), icon: "pro2", firstName: "John", lastName: "Doe", profession: .psychiatrists, gender: .male, religion: .christian, currentLocation: CLLocationCoordinate2D(latitude: 12.34, longitude: 12.34), meeting: .online)
let professional2 = ProfessionalView.Professional(id: UUID(), icon: "pro1", firstName: "Jane", lastName: "Smith", profession: .therapist, gender: .female, religion: .buddhist, currentLocation: CLLocationCoordinate2D(latitude: 12.34, longitude: 12.34), meeting: .inPerson)

// Create some sample dates
let date1 = Date()
let date2 = Date(timeIntervalSinceNow: 86400) // 24 hours later

// Initialize an array of appointments
let appointments: [Appointment] = [
    Appointment(id: UUID(), professional: professional1, user: UserView.MOCKUSER, date: date1, meeting: .online),
    Appointment(id: UUID(), professional: professional2, user: UserView.MOCKUSER, date: date2, meeting: .inPerson)
]

