//
//  SettingsRowView.swift
//  Solace
//
//  Created by Brandon Williams on 3/16/24.
//

import SwiftUI

struct SettingRowView: View {
    let imageName: String
    let title: String
    let tintcolor: Color
    
    
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: imageName)
                .imageScale(.small)
                .font(.title)
                .foregroundColor(tintcolor)
            
            Text(title)
                .font(.subheadline)
                .foregroundColor(.black)
        }
    }
}

#Preview {
    SettingRowView(imageName: "", title: "", tintcolor: .black)
}
