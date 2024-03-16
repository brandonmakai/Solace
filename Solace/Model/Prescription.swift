//
//  Prescription.swift
//  Solace
//
//  Created by Brandon Williams on 3/16/24.
//

import SwiftUI
import CoreLocation

struct Prescription: Hashable, Equatable, Codable {
    let id: UUID
    let name: String
    let professoinal: ProfessionalView.Professional
    let user: UserView.User
    var file: URL?
    
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

extension Prescription {
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case professoinal
        case user
        case file
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(UUID.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        professoinal = try container.decode(ProfessionalView.Professional.self, forKey: .professoinal)
        user = try container.decode(UserView.User.self, forKey: .user)
        file = try container.decodeIfPresent(URL.self, forKey: .file) // Updated here
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(professoinal, forKey: .professoinal)
        try container.encode(user, forKey: .user)
        try container.encodeIfPresent(file, forKey: .file)
    }
}

var prescriptions: [Prescription] = []


