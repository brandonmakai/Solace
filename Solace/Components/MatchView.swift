//
//  NearYouView.swift
//  Solace
//
//  Created by Brandon Williams on 3/15/24.
//

import SwiftUI
import CoreLocation

struct MatchView: View {
    @EnvironmentObject var professionalView: ProfessionalView
    @EnvironmentObject var userView: UserView
    @State var selectedProfessional: ProfessionalView.Professional
    let user = UserView.MOCKUSER
    var body: some View {
        VStack{
            Text("Matched Professionals")
                .customTitle()
            
            LazyVGrid(columns: [GridItem(.flexible(), spacing: -20), GridItem(.flexible())]) {
                ForEach(professionalView.Professionals, id: \.id) { professional in
                    professionalRow(user: user, professional: professional)
                        .gesture (
                            TapGesture()
                                .onEnded{ gesture in
                                    selectedProfessional = professional
                                }
                        )
                }
            }
            
            Spacer()
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.brownGradient)
        .onAppear {
            print(professionalView.Professionals)
        }
    }
    func professionalRow(user: UserView.User, professional: ProfessionalView.Professional) -> some View {
        ZStack(alignment: .bottomLeading){
            Image(professional.icon)
                .resizable()
                .scaledToFill()
                .frame(width: 175, height: 175)
                .clipShape(Circle())
            Circle()
                .frame(width: 130, height: 130)
                .foregroundColor(.darkBrown)
                .shadow(radius: 10)
                .overlay (
                    VStack(alignment: .leading){
                        Text(professional.firstName)
                            .foregroundColor(.white)
                            .fontWeight(.semibold)
                            .font(.system(size: 20))
                        VStack(alignment: .leading){
                            Text("\(professional.profession.rawValue)")
                            if let distance = userView.distanceBetween(user: user, professional: professional) {
                                Text("\(distance) mi away")
                            } else {
                                Text("Distance Unknwon")
                            }
                        }
                        .foregroundColor(.white)
                        .font(.system(size: 15))
                        .fontWeight(.medium)
                    }
                )
                .offset(x: -10, y: 90)
        }
    }
    
}


#Preview {
    let professionalView = ProfessionalView()
    return MatchView(selectedProfessional: ProfessionalView.Professional(id: UUID(), icon: "pro1", firstName: "Melissa", lastName: "Smith", profession: .psychiatrists, gender: .female, religion: .christian ,currentLocation: Location(latitude: -34.34, longitude: 12.34), meeting: .inPerson))
        .environmentObject(professionalView)
}
