//
//  QuestionNavigation.swift
//  Solace
//
//  Created by Brandon Williams on 3/15/24.
//

import SwiftUI

struct QuestionNavigation: ViewModifier {
    func body(content: Content) -> some View {
            RoundedRectangle(cornerRadius: 30)
                .frame(width: 350, height: 50)
                .foregroundColor(.darkBrown)
                .overlay (
                        content
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                        .font(.system(size: 30))
                )
            
    }
}

extension View {
    func questionNavigation() -> some View {
        modifier(QuestionNavigation())
    }
}
