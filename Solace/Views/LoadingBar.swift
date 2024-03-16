//
//  LoadingBar.swift
//  Solace
//
//  Created by Brandon Williams on 3/15/24.
//

import SwiftUI

struct LoadingBar: View {
    @State var currentIndex: Int
    @State var width: CGFloat = 0
    var body: some View {
        ZStack(alignment: .leading){
            RoundedRectangle(cornerRadius: 15)
                .frame(width: 300, height: 15)
                .foregroundColor(Color(.systemGray5))
            RoundedRectangle(cornerRadius: 15)
                .frame(width: width, height: 15)
                .foregroundColor(.darkBrown)
        }
        .onAppear {
            switch currentIndex {
            case 0:
                self.width = 0 // Why?
            case 1:
                self.width = 100 // Appointment Location
            case 2:
                self.width = 200 //Gender?
            case 3:
                self.width = 300 // Religion?
            default:
                self.width = 0
            }
        }
        .animation(.easeIn, value: width)
    }
}

#Preview {
    LoadingBar(currentIndex: 2)
}
