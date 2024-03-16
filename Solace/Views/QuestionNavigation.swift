//
//  QuestionNavigation.swift
//  Solace
//
//  Created by Brandon Williams on 3/15/24.
//

import SwiftUI

struct QuestionNavigation: View {
    var body: some View {
            RoundedRectangle(cornerRadius: 30)
                .frame(width: 350, height: 50)
                .foregroundColor(.darkBrown)
                .overlay (
                    HStack(spacing: 4){
                        Text("Next Steps")
                        Image(systemName: "arrow.right")
                    }
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                        .font(.system(size: 30))
                )
            
    }
}

#Preview {
    QuestionNavigation()
}
