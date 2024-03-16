//
//  GeneralPreferencesView.swift
//  Solace
//
//  Created by Brandon Williams on 3/15/24.
//

import SwiftUI

enum Symptoms: String {
    case anxietyStress = "Anxiety/Stress"
    case depression = "Depression"
    case trauma = "Trauma"
    case prescription = "Prescription"
}

let symptomImages = (symptom: Symptoms, image: String, color: Color).self

struct SymptomsQuestion: View {
    @EnvironmentObject var professionalView: ProfessionalView
    @EnvironmentObject var userView: UserView
    
    @State var currentIndex = 0
    
    let user = UserView.MOCKUSER
    var body: some View {
        NavigationStack{
            VStack{
                LoadingBar(currentIndex: currentIndex)
                
                Text("General Preferences")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .padding(.trailing, 30)
                    .padding(.top, 20)
                VStack{
                    Text("""
                    Why are you using
                    Solace for help?
                    """)
                    .fontWeight(.semibold)
                    .font(.title)
                    LazyVGrid(columns: [GridItem(.fixed(20), spacing: 170),
                        GridItem(.fixed(20))], spacing: 30, content: {
                        symptomRow(image: "stressImage", symptom: .anxietyStress, color: .lightYellow)
                        symptomRow(image: "traumaImage", symptom: .trauma, color: .lightBrown)
                        symptomRow(image: "depressionImage", symptom: .depression, color: .lightBrown)
                        symptomRow(image: "prescriptionImage", symptom: .prescription, color: .lightBrown)
                    })
                }
                .padding(.top, 50)
                

                Spacer()
                NavigationLink {
                    LocationQuestion()
                        .navigationBarBackButtonHidden()
                } label: {
                    QuestionNavigation()
                }
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.lightYellow1)
            .preferredColorScheme(.dark)
        }
    }
    
    func symptomRow(image: String, symptom: UserView.GeneralPreference, color: Color) -> some View {
        ZStack(alignment: .bottom){
            RoundedRectangle(cornerRadius: 5)
                .frame(width: 180, height: 40)
                .foregroundColor(color)
                .overlay {
                    Text("\(symptom.rawValue)")
                        .fontWeight(.medium)
                }
                .shadow(radius: 10)

            Image(image)
                .resizable()
                .scaledToFill()
                .frame(width: 150, height: 150)
                .clipShape(RoundedRectangle(cornerRadius: 5))
                .padding(.bottom, 30)
        }
    }
    
}

#Preview {
    SymptomsQuestion()
}
