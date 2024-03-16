//
//  AppointmentManagerView.swift
//  Solace
//
//  Created by Brandon Williams on 3/16/24.
//

/*
import SwiftUI

struct AppointmentManagerView: View {
    @State private var selectedUser: UserView.User?
    @State private var prescriptionSheetPresented = false
    
    @EnvironmentObject var professionalView: ProfessionalView
    
    var body: some View {
        NavigationStack {
            VStack{
                 List(professionalView.Professionals.flatMap { $0.appointments?.map { $0.user } ?? [] }, id: \.id) { user in
                    appointmentRow(user: user)
                        .gesture (
                            TapGesture()
                                .onEnded { gesture in
                                selectedUser = user
                                    prescriptionSheetPresented = true
                                })
                }
                .background(Color.brown)
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.brown)
            .navigationTitle("Appointment Manager")
            .sheet(isPresented: $prescriptionSheetPresented) {
                if let user = selectedUser {
                    PrescriptionSheetView()
                }
            }
            
        }
    }
    func appointmentRow(user: UserView.User) -> some View {
        HStack{
            Image(user.icon)
                .resizable()
                .frame(width: 50, height: 50)
                .clipShape(Circle())
            Text("\(user.firstName) \(user.lastName)")
        }
    }
}

#Preview {
    let professionalView = ProfessionalView()
    return AppointmentManagerView()
        .environmentObject(professionalView)
}
*/
