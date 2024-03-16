//
//  TitleModifier.swift
//  Solace
//
//  Created by Brandon Williams on 3/16/24.
//

import SwiftUI

struct CustomTitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .fontWeight(.semibold)
            .padding(.trailing, 30)
            .padding(.top, 20)
    }
}

extension View {
    func customTitle() -> some View {
        modifier(CustomTitle())
    }
}
