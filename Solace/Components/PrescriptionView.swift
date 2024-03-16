//
//  PrescriptionView.swift
//  Solace
//
//  Created by Brandon Williams on 3/16/24.
//

import SwiftUI
import CoreLocation

struct PrescriptionView: View {
    @EnvironmentObject var userView: UserView
    let user = UserView.MOCKUSER
    var body: some View {
        VStack(alignment: .leading){
            Text("Prescriptions")
                .customTitle()
                // TODO: Please make it an emptyView if there is no prescriptions
            ForEach(user.prescriptions ?? [Prescription(id: UUID(), name: "", professoinal: ProfessionalView.Professional(id: UUID(), icon: "pro1", firstName: "Melissa", lastName: "Smith", profession: .psychiatrists, gender: .female, religion: .christian ,currentLocation: CLLocationCoordinate2D(latitude: -34.34, longitude: 12.34), meeting: .inPerson), user: user)], id: \.id) { prescription in
                    prescriptionRow(prescription: prescription)
                
            }
            Spacer()
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.brownGradient)
    }
    
    func prescriptionRow(prescription: Prescription) -> some View {
        ZStack{
            RoundedRectangle(cornerRadius: 5)
                .frame(width: 350, height: 100)
                .foregroundColor(.darkBrown)
            HStack{
                VStack(alignment: .leading){
                    Text("\(prescription.name)")
                    Text("Profession: \(prescription.professoinal.profession.rawValue)")
                    // TODO: Implement File
                }
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .padding(.leading, 20)

                Spacer()
                Image(prescription.professoinal.icon)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
                    .padding(.trailing, 20)

            }
            .frame(width: 350)
        }
    }
}

#Preview {
    PrescriptionView()
}
