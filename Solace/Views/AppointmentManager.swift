//
//  AppointmentManager.swift
//  Solace
//
//  Created by Brandon Williams on 3/16/24.
//

import SwiftUI

class AppointmentManager: ObservableObject {
    @EnvironmentObject var professionalView: ProfessionalView
    @EnvironmentObject var userView: UserView
    @EnvironmentObject var authService: AuthService
    static var shared = AppointmentManager()
    
    public var appointments: [Appointment] = []
    
    init() {
        // Initialize an initial appointment and add it to the appointments array
        if let appointment = fullAppointment() {
            addAppointment(appointment)
        }
    }
    
    func addAppointment(_ appointment: Appointment) {
        appointments.append(appointment)
    }
    
    
    func fullAppointment() -> Appointment? {
        // TODO: Remove this
        guard let selectedProfessional = professionalView.Professionals.first else {
            // Handle case where no professionals are available
            print("No professionals available")
            return nil
        }
        let selectedUser = authService.currentUser
        let date = Date(timeIntervalSinceNow: 86400)
        
        let newAppointment = Appointment(id: UUID(),
                                         professional: selectedProfessional,
                                         user: authService.currentUser,
                                         date: date,
                                         meeting: .inPerson)
        
        return newAppointment
    }
}

