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
    @State var Online: ProfessionalView.MeetingLocation
    var body: some View {
        NavigationStack {
            ScrollView {
                ZStack(alignment: .bottom) {
                    VStack(alignment: .leading, spacing: 20) {
                            Text("Hello, \(user.firstName) ")
                                .customTitle()
                            
                            VStack(alignment: .leading){
                                SectionHeader("Discuss With Professionals")
                                
                                
                                // Shuffle the Professionals array and take the first three professionals
                                HStack{
                                    ForEach(Array(professionalView.Professionals.shuffled().prefix(3)), id: \.self) { professional in
                                        professionalRow(professional: professional)
                                    }
                                }
                            }
                            VStack(alignment: .leading){
                                SectionHeader("Appointments")
                                ForEach(appointments, id: \.self) { appointment in
                                    appointmentRow(appointment: appointment, isOnline: Online == ProfessionalView.MeetingLocation.online)
                                    
                                }
                                
                            }
                            
                            Spacer()
                    }
                    VStack(alignment: .leading){
                        SectionHeader("Professionals Near You")
                            .padding(.leading, 30)
                        ZStack {
                            RoundedRectangle(cornerRadius: 30)
                                .frame(width: 400, height: 300)
                                .foregroundColor(.darkBrown)
                            ForEach(userView.closestProfessionals(user: user, professionalView: professionalView), id: \.self) { professional in
                                closestProfessionalRow(professional: professional)
                            }
                        }
                    }
                    .padding(.top, 456)
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
            .font(.system(size: 23))
    }
    
    func closestProfessionalRow(professional: ProfessionalView.Professional) -> some View {
        Image(professional.icon)
            .resizable()
            .scaledToFill()
            .frame(width: 150, height: 150)
    }
    
    func appointmentRow(appointment: Appointment, isOnline: Bool) -> some View {
        ZStack{
            RoundedRectangle(cornerRadius: 5)
                .foregroundColor(.darkBrown)
                .frame(width: 350, height: 80)
            HStack{
                HStack{
                    VStack(alignment: .leading){
                        Text("\(appointment.monthShort)")
                        Text("\(appointment.dayOfMonth)")
                    }
                    VStack(alignment: .leading){
                        Text("\(appointment.professional.firstName) \(appointment.professional.lastName)")
                        
                        HStack(spacing: 1){ Text("Location: ")
                            Text("\(appointment.meeting.rawValue)")
                                .foregroundColor(isOnline ? .blue : .lightBrown)
                        }
                    }
                }
                .foregroundColor(.white)
                .fontWeight(.medium)
                .font(.system(size: 20))
                .padding(.leading, 20)
                Spacer()
                Image(appointment.professional.icon)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 60, height: 60)
                    .clipShape(Circle())
                    .padding(.trailing, 20)
            }
            .frame(width: 350)
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
    return ContentView(Online: ProfessionalView.MeetingLocation.inPerson)
        .environmentObject(professionalView)
        .environmentObject(userView)
}
