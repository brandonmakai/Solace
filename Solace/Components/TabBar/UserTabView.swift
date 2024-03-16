//
//  UserTabView.swift
//  Solace
//
//  Created by Brandon Williams on 3/15/24.
//

import SwiftUI

struct UserTabView: View {
    @EnvironmentObject var professionalView: ProfessionalView
    @EnvironmentObject var userView: UserView
    
    var body: some View {
        TabView{
            ContentView()
                .tabItem { Label("Home", systemImage: "house") }
                .onAppear {
                    professionalView.addMOCKProfessions()
                }
                .environmentObject(professionalView)
                .environmentObject(userView)
        }
        .tint(.white)
    }
}

#Preview {
    let userView = UserView()

    return UserTabView()
        .environmentObject(userView)

}
