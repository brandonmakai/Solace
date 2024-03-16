//
//  Professional.swift
//  Solace
//
//  Created by Brandon Williams on 3/15/24.
//

import SwiftUI
import CoreLocation

class ProfessionalView: ObservableObject {
    
    struct Professional: Identifiable, Hashable {
        let id: UUID
        let icon: String
        let firstName: String
        let lastName: String
        let profession: Professions
        let gender: Gender
        let rating: Double? = nil
        let location: CLLocationCoordinate2D
        
        func hash(into hasher: inout Hasher) {
            hasher.combine(id)
        }
        
        static func == (lhs: Professional, rhs: Professional) -> Bool {
            return lhs.id == rhs.id
        }
    }
    
    enum Professions: String {
        case psychiatrists = "Psychiatrists"
        case therapist = "Therapist"
        case psychologists = "Psychologists"
    }
    
    enum Gender: String {
        case male = "He/Him"
        case female = "She/Her"
        case nonBinary = "They/Them"
    }
    
    @Published var Professionals: [Professional] = []
    
    func addMOCKProfessions() {
        Professionals.append(Professional(id: UUID(), icon: "pro1", firstName: "Melissa", lastName: "Smith", profession: .psychiatrists, gender: .female, location: CLLocationCoordinate2D(latitude: -34.34, longitude: 12.34)))
        Professionals.append(Professional(id: UUID(), icon: "pro2", firstName: "John", lastName: "Jackson", profession: .psychologists, gender: .male, location: CLLocationCoordinate2D(latitude: -34.34, longitude: 12.34)))
    }
    
}
