//
//  SolaceApp.swift
//  Solace
//
//  Created by Brandon Williams on 3/15/24.
//

import SwiftUI

@main
struct SolaceApp: App {
    @StateObject var professionalView = ProfessionalView()
    @StateObject var userView = UserView()
    var body: some Scene {
        WindowGroup {
            SymptomsQuestion(currentIndex: 0)
                .environmentObject(professionalView)
                .environmentObject(userView)
        }
    }
}
