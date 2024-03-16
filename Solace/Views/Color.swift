//
//  Color.swift
//  Solace
//
//  Created by Brandon Williams on 3/15/24.
//

import SwiftUI

extension Color {
    
    static let lightBrown = Color(hex: 0x80471C)
    static let darkBrown = Color(hex: 0x3C280D)
    static let lightYellow = Color(hex: 0xFFD881)
    static let lightYellow1 = Color(hex: 0xD0AD77)
    static let brownGradient = LinearGradient(colors: [lightBrown, darkBrown], startPoint: .top, endPoint: .bottom)
    
    init(hex: UInt, alpha: Double = 1.0) {
        self.init (
            .sRGB,
            red: Double((hex >> 16) & 0xFF) / 255.0,
            green: Double((hex >> 8) & 0xFF) / 255.0,
            blue: Double(hex & 0xFF) / 255.0,
            opacity: alpha
        )
    }
}
