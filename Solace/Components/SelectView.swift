//
//  SelectView.swift
//  Solace
//
//  Created by Brandon Williams on 3/15/24.
//

import SwiftUI

struct SelectView: View {
    @State var greetings: [String] = []
    @EnvironmentObject var userView: UserView
    @EnvironmentObject var professionalView: ProfessionalView
    var dayCounter = DayCounter()
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 20){
                VStack(alignment: .leading){
                    SectionHeader(text: "Solace Streak")
                    Text("\(dayCounter.daysPassed) Days")
                        .foregroundColor(.lightYellow)
                        .font(.system(size: 35))
                        .fontWeight(.semibold)
                }
                .padding(.leading, 5)
                
                VStack{
                    SectionHeader(text: "Discuss With Professionals")
                    HStack{
                        ForEach(professionalView.Professionals, id: \.self) { professional in
                            professionalRow(image: professional.icon)
                        }
                    }
                }
                .padding(.leading, 5)
                
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.brownGradient)
            .preferredColorScheme(.dark)
            .navigationTitle("Good Afternoon")
            .navigationBarTitleDisplayMode(.large)
        }
    }
    func professionalRow(image: String) -> some View {
        Image(image)
            .resizable()
            .scaledToFill()
            .frame(width: 100, height: 100)
            .clipShape(Circle())
    }
}

func SectionHeader(text: String) -> some View {
    Text(text)
        .font(.system(size: 25))
        .fontWeight(.medium)
        .foregroundColor(.white)
}

#Preview {
    let professionalView = ProfessionalView()
    return SelectView()
        .environmentObject(professionalView)
}
