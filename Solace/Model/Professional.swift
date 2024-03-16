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
        let religion: Religion
        let rating: Double? = nil
        let currentLocation: CLLocationCoordinate2D
        let meeting: MeetingLocation
        
        func hash(into hasher: inout Hasher) {
            hasher.combine(id)
        }
        
        static func == (lhs: Professional, rhs: Professional) -> Bool {
            return lhs.id == rhs.id
        }
    }
    
    enum Professions: String {
        case psychiatrists = "Psychiatrists" // Pair with any GeneralPreferences Selection
        case therapist = "Therapist" // Pair with anything, but prescription
        case psychologists = "Psychologists" // Pair with anything, but prescription
    }
    
    enum Gender: String {
        case male = "He/Him" // Pair with male preferences
        case female = "She/Her" // Pair with female preferences
        case nonBinary = "They/Them" // Pair with nonBinary preferences
        // If none pair with anything
    }
    
    enum MeetingLocation: String {
        case online = "Online"
        case inPerson = "In Person"
        case none = "No Preference"
    }
    
    enum Religion: String {
        case catholic = "Catholic"
        case baptist = "Baptist"
        case christian = "Christian"
        case islam = "Islam"
        case hindu = "Hindu"
        case buddhist = "Buddhist"
        case atheist = "Athiest"
        case none = "No Preference"
    }
    
    @Published var Professionals: [Professional] = []
    
    func addMOCKProfessions() {
        Professionals.append(Professional(id: UUID(), icon: "pro1", firstName: "Melissa", lastName: "Smith", profession: .psychiatrists, gender: .female, religion: .christian ,currentLocation: CLLocationCoordinate2D(latitude: -34.34, longitude: 12.34), meeting: .inPerson))
        Professionals.append(Professional(id: UUID(), icon: "pro2", firstName: "John", lastName: "Joe", profession: .psychiatrists, gender: .male, religion: .islam ,currentLocation: CLLocationCoordinate2D(latitude: -34.34, longitude: 12.34), meeting: .online))
    }
    
}
