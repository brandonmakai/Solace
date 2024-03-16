//
//  NearYouView.swift
//  Solace
//
//  Created by Brandon Williams on 3/15/24.
//

import SwiftUI

struct NearYouView: View {
    @EnvironmentObject var professionalView: ProfessionalView
    @EnvironmentObject var userView: UserView
    let user = UserView.MOCKUSER
    var body: some View {
        VStack{
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .onAppear {
            professionalView.addMOCKProfessions()
        }
    }
    func professionalRow(user: UserView.User, professional: ProfessionalView.Professional) -> some View {
        ZStack{
            Image(professional.icon)
                .resizable()
                .scaledToFill()
                .frame(width: 200, height: 250)
                .clipShape(Circle())
            Circle()
                .frame(width: 200, height: 200)
                .overlay (
                    VStack{
                        Text(professional.firstName)
                        VStack{
                            Text("\(professional.profession.rawValue)")
                            Text("\(userView.distanceBetween(user: user, professional: professional))")
                        }
                    }
                )
        }
        
    }
}

#Preview {
    let professionalView = ProfessionalView()
    return NearYouView()
        .environmentObject(professionalView)
        .onAppear {
            professionalView.addMOCKProfessions()
        }
}
