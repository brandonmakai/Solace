//
//  TherapistPreferences.swift
//  Solace
//
//  Created by Brandon Williams on 3/16/24.
//

import SwiftUI

struct GenderQuestion: View {
    @EnvironmentObject var professionalView: ProfessionalView
    @EnvironmentObject var userView: UserView
    let user = UserView.MOCKUSER
    
    @State var currentIndex = 2
    var body: some View {
        NavigationStack {
            VStack{
                LoadingBar(currentIndex: currentIndex)
                
                Text("Pairing Preferences")
                    .customTitle()
                
                VStack{
                    Text("""
                Which gender would you prefer?
                """)
                    .fontWeight(.semibold)
                    .font(.title)
                    .foregroundColor(.white)
                    VStack(spacing: 20) {
                        SelectionOption(text: UserView.GenderPreference.male.rawValue)
                        SelectionOption(text: UserView.GenderPreference.female.rawValue)
                        SelectionOption(text: UserView.GenderPreference.nonBinary.rawValue)
                        SelectionOption(text: UserView.LocationPreference.none.rawValue)
                    }
                }
                .padding(.top, 50)
                
                Spacer()
                NavigationLink {
                    ReligionQuestion()
                        .navigationBarBackButtonHidden()
                } label: {
                    HStack{
                        Text("Next Steps")
                        Image(systemName: "arrow.right")
                    }
                    .questionNavigation()
                }
            }
            .preferredColorScheme(.light)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.lightYellow)
        }
    }
}

#Preview {
    GenderQuestion()
}
