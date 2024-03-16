//
//  Prescription.swift
//  Solace
//
//  Created by Brandon Williams on 3/16/24.
//

import SwiftUI
import CoreLocation

struct Prescription: Hashable, Equatable {
    let id: UUID
    let name: String
    let professoinal: ProfessionalView.Professional
    let user: UserView.User
    var file: FileDocument? = nil
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(name)
        hasher.combine(professoinal)
        hasher.combine(user)
    }
    
    static func == (lhs: Prescription, rhs: Prescription) -> Bool {
        return lhs.id == rhs.id && lhs.name == rhs.name && lhs.professoinal == rhs.professoinal && lhs.user == rhs.user
    }
}

var prescriptions: [Prescription] = []


