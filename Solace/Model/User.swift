//
//  User.swift
//  Solace
//
//  Created by Brandon Williams on 3/15/24.
//

import SwiftUI
import CoreLocation

class UserView: Identifiable, ObservableObject {
    
    struct User: Hashable {
        let id: UUID
        let firstName: String
        let lastName: String
        let icon: String
        let currentLocation: CLLocationCoordinate2D
        let preferences: Preference? = nil
        var appointments: [Appointment]? = nil
        var prescriptions: [Prescription]? = nil
        
        func hash(into hasher: inout Hasher) {
            hasher.combine(id)
            hasher.combine(firstName)
            hasher.combine(lastName)
            hasher.combine(icon)
            hasher.combine(currentLocation)
            hasher.combine(preferences)
            hasher.combine(appointments)
            hasher.combine(prescriptions)
        }
    }
    
    struct Preference: Hashable {
        let general: GeneralPreference
        let location: LocationPreference
        let religion: ReligiousPreference
        let gender: GenderPreference
    }
    
    enum GeneralPreference: String {
        case anxietyStress = "Anxiety/Stress"
        case depression = "Depression"
        case trauma = "Trauma"
        case prescription = "Prescription"
    }
    
    enum LocationPreference: String {
        case online = "Online"
        case inPerson = "In Person"
        case none = "No Preference"
    }
    
    enum ReligiousPreference: String {
        case catholic = "Catholic"
        case baptist = "Baptist"
        case christian = "Christian"
        case islam = "Islam"
        case hindu = "Hindu"
        case buddhist = "Buddhist"
        case atheist = "Athiest"
        case none = "No Preference"
    }
    
    enum GenderPreference: String {
        case male = "He/Him"
        case female = "She/Her"
        case nonBinary = "They/Them"
        case none = "No Preferences"
    }
    
    static let MOCKUSER = User(id: UUID(), firstName: "Brandon", lastName: "Williams", icon: "placeholder", currentLocation: CLLocationCoordinate2D(latitude: 34.56, longitude: 56.56))
    
    func distanceBetween(user: User, professional: ProfessionalView.Professional) -> Int {
        let userLocation = CLLocation(latitude: user.currentLocation.latitude, longitude: user.currentLocation.longitude)
        let professionalLocation = CLLocation(latitude: professional.currentLocation.latitude, longitude: professional.currentLocation.longitude)
        let distanceMeters = userLocation.distance(from: professionalLocation)
        let distanceMiles = distanceMeters * 0.000621371
        let roundedMileDistance = Int(distanceMiles.rounded())
        return roundedMileDistance
    }
    
    func closestProfessionals(user: User, professionalView: ProfessionalView) -> [ProfessionalView.Professional] {
        // Calculate distances for all professionals
        let professionalsWithDistance = professionalView.Professionals.map { professional -> (ProfessionalView.Professional, Int) in
            let distance = distanceBetween(user: user, professional: professional)
            return (professional, distance)
        }
        
        // Sort professionals based on distance
        let sortedProfessionals = professionalsWithDistance.sorted { $0.1 < $1.1 }
        
        // Take the closest 4 professionals
        let closestProfessionals = sortedProfessionals.prefix(4).map { $0.0 }
        
        return closestProfessionals
    }
}

extension CLLocationCoordinate2D: Hashable {
    
    public static func == (lhs: CLLocationCoordinate2D, rhs: CLLocationCoordinate2D) -> Bool {
        return lhs.latitude == rhs.latitude && lhs.longitude == rhs.longitude
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(latitude)
        hasher.combine(longitude)
    }
}
