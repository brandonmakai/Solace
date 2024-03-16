//
//  SolaceApp.swift
//  Solace
//
//  Created by Brandon Williams on 3/15/24.
//

import SwiftUI
import Firebase

@main

struct SolaceApp: App {
    
    init() {
        FirebaseApp.configure()
        
        // Disable swizzling
        UserDefaults.standard.set(false, forKey: "_FIRDebugEnabled")
        UserDefaults.standard.synchronize()
        
    }
    
    @StateObject var professionalView = ProfessionalView()
    @StateObject var userView = UserView()
    @StateObject var appointmentManager = AppointmentManager()
    var body: some Scene {
        WindowGroup {
            ReligionQuestion(currentIndex: 3)
                .environmentObject(professionalView)
                .environmentObject(userView)
                .environmentObject(appointmentManager)
        }
    }
}
