//
//  ReligionQuestion.swift
//  Solace
//
//  Created by Brandon Williams on 3/16/24.
//

import SwiftUI
import CoreLocation

struct ReligionQuestion: View {
    @EnvironmentObject var professionalView: ProfessionalView
    @EnvironmentObject var userView: UserView
    let user = UserView.MOCKUSER
    
    @State var currentIndex = 3
    var body: some View {
        NavigationStack {
            VStack{
                LoadingBar(currentIndex: currentIndex)
                
                Text("Pairing Preferences")
                    .customTitle()
                
                VStack{
                    Text("""
                Which religion would you prefer?
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
                    MatchView(selectedProfessional: ProfessionalView.Professional(id: UUID(), icon: "pro1", firstName: "Melissa", lastName: "Smith", profession: .psychiatrists, gender: .female, religion: .christian ,currentLocation: CLLocationCoordinate2D(latitude: -34.34, longitude: 12.34), meeting: .inPerson))
                        .navigationBarBackButtonHidden()
                        .onAppear {
                            professionalView.addMOCKProfessions()
                        }
                } label: {
                    HStack{
                        Text("Finish")
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
    ReligionQuestion()
}
