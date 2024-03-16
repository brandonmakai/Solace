//
//  ContentView.swift
//  Solace
//
//  Created by Brandon Williams on 3/15/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var userView: UserView
    @EnvironmentObject var professionalView: ProfessionalView
    let user = UserView.MOCKUSER
    var body: some View {
        NavigationStack {
            VStack{
                Text("Hello, \(user.firstName) ")
                    .customTitle()
                
                VStack{
                    SectionHeader("Discuss With Professionals")
                    

                    // Shuffle the Professionals array and take the first three professionals
                    HStack{
                        ForEach(Array(professionalView.Professionals.shuffled().prefix(3)), id: \.self) { professional in
                            professionalRow(professional: professional)
                        }
                    }
                    
                    VStack{
                        SectionHeader("Appointments")
                        
                    }
                    
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.brownGradient)
        }
    }
    func SectionHeader(_ text: String) -> some View {
         Text(text)
            .foregroundColor(.white)
            .fontWeight(.medium)
    }
    
    func appointmentRow(appointment: Appointment) -> some View {
        ZStack{
            RoundedRectangle(cornerRadius: 5)
                .foregroundColor(.darkBrown)
                .frame(width: 350, height: 60)
            HStack{
                HStack{
                    VStack{
                        Text("\(appointment.professional.firstName) \(appointment.professional.lastName)")
                        Text("Location: \(appointment.meeting.rawValue)")
                    }
                    Text(\(appointment.date))
                }
            }
        }
    }
    
    func professionalRow(professional: ProfessionalView.Professional) -> some View{
        Image(professional.icon)
            .resizable()
            .frame(width: 80, height: 80)
            .scaledToFill()
            .clipShape(Circle())
    }
}

#Preview {
    let professionalView = ProfessionalView()
    let userView = UserView()
    return ContentView()
        .environmentObject(professionalView)
        .environmentObject(userView)
}
