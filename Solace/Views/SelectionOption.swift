//
//  SelectionOption.swift
//  Solace
//
//  Created by Brandon Williams on 3/15/24.
//

import SwiftUI

struct SelectionOption: View {
    @State var text: String
    var body: some View {
        RoundedRectangle(cornerRadius: 40)
            .frame(width: 300, height: 60)
            .foregroundColor(.lightBrown)
            .overlay (
                Text(text)
                    .foregroundColor(.white)
                    .fontWeight(.medium)
                    .font(.system(size: 20))
            )
    }
}

#Preview {
    SelectionOption(text: "Test")
}
