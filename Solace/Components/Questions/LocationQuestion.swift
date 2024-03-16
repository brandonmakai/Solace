//
//  LocationQuest.swift
//  Solace
//
//  Created by Brandon Williams on 3/15/24.
//

import SwiftUI

struct LocationQuestion: View {
    @EnvironmentObject var professionalView: ProfessionalView
    @EnvironmentObject var userView: UserView
    let user = UserView.MOCKUSER
    
    @State var currentIndex = 1
    var body: some View {
        NavigationStack {
            VStack{
                LoadingBar(currentIndex: currentIndex)
                
                Text("General Preferences")
                    .customTitle()
                
                VStack{
                    Text("""
                How would you like your appointment?
                """)
                    .fontWeight(.semibold)
                    .font(.title)
                    .foregroundColor(.white)
                    VStack(spacing: 20) {
                        SelectionOption(text: UserView.LocationPreference.online.rawValue)
                        SelectionOption(text: UserView.LocationPreference.inPerson.rawValue)
                        SelectionOption(text: UserView.LocationPreference.none.rawValue)
                    }
                }
                .padding(.top, 50)
                
                Spacer()
                NavigationLink {
                    GenderQuestion()
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
    LocationQuestion()
}
