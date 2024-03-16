//
//  User.swift
//  Solace
//
//  Created by Brandon Williams on 3/15/24.
//

import SwiftUI
import CoreLocation
import Foundation
import Firebase
import FirebaseFirestore

class UserView: Identifiable, ObservableObject {
    
    @ObservedObject var locationManager = LocationManager()

    struct User: Hashable, Codable {
        let id: String
        let firstName: String
        let lastName: String
        let email: String
        let icon: String?
        let preferences: Preference?
        var prescriptions: [Prescription]?
        
        var initials: String {
            guard let firstNameInitial = firstName.first, let lastNameInitial = lastName.first else {
                return "" // Handle cases where either first name or last name is empty
            }
            
            return String(firstNameInitial) + String(lastNameInitial)
        }
        
        func hash(into hasher: inout Hasher) {
            hasher.combine(id)
            hasher.combine(firstName)
            hasher.combine(lastName)
            hasher.combine(icon)
            hasher.combine(preferences)
            // hasher.combine(prescriptions)
        }
        
        // Implement Codable protocol
        enum CodingKeys: String, CodingKey {
            case id
            case firstName
            case lastName
            case email
            case icon
            case preferences
            case prescriptions
        }
        
        
        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            // Decode other properties normally
            id = try container.decode(String.self, forKey: .id)
            firstName = try container.decode(String.self, forKey: .firstName)
            lastName = try container.decode(String.self, forKey: .lastName)
            email = try container.decode(String.self, forKey: .email)
            icon = try container.decodeIfPresent(String.self, forKey: .icon)
            preferences = try container.decodeIfPresent(Preference.self, forKey: .preferences)

            // Decode prescriptions array
            prescriptions = try container.decodeIfPresent([Prescription].self, forKey: .prescriptions)
        }
        
    }
    
    struct Preference: Hashable, Codable {
        let general: GeneralPreference
        let location: LocationPreference
        let religion: ReligiousPreference
        let gender: GenderPreference
    }
    
    enum GeneralPreference: String, Codable {
        case anxietyStress = "Anxiety/Stress"
        case depression = "Depression"
        case trauma = "Trauma"
        case prescription = "Prescription"
    }
    
    enum LocationPreference: String, Codable {
        case online = "Online"
        case inPerson = "In Person"
        case none = "No Preference"
    }
    
    enum ReligiousPreference: String, Codable {
        case catholic = "Catholic"
        case baptist = "Baptist"
        case christian = "Christian"
        case islam = "Islam"
        case hindu = "Hindu"
        case buddhist = "Buddhist"
        case atheist = "Athiest"
        case none = "No Preference"
    }
    
    enum GenderPreference: String, Codable {
        case male = "He/Him"
        case female = "She/Her"
        case nonBinary = "They/Them"
        case none = "No Preferences"
    }
    
    func distanceBetween(user: User, professional: ProfessionalView.Professional) -> Int? {
        // Check if locationManager.currentLocation is not nil
        if let userLocation = locationManager.currentLocation {
            // If professional.currentLocation is not nil, create CLLocation
            if let professionalLocation = professional.currentLocation {
                let professionalCLLocation = CLLocation(latitude: professionalLocation.latitude, longitude: professionalLocation.longitude)
                
                // Calculate distance within the scope where professionalLocation is defined
                let distanceMeters = userLocation.distance(from: professionalCLLocation)
                let distanceMiles = distanceMeters * 0.000621371
                let roundedMileDistance = Int(distanceMiles.rounded())
                return roundedMileDistance
            } else {
                // Handle the case where professional.currentLocation is nil
                print("Professional's location is nil")
                return nil // Return nil in this case
            }
        } else {
            // Handle the case where locationManager.currentLocation is nil
            print("User's location is nil")
            return nil // Return nil in this case
        }
    }
    
    func closestProfessionals(user: User, professionalView: ProfessionalView) -> [ProfessionalView.Professional]? {
        // Calculate distances for all professionals
        let professionalsWithDistance = professionalView.Professionals.compactMap { professional -> (ProfessionalView.Professional, Int)? in
            if let distance = distanceBetween(user: user, professional: professional) {
                return (professional, distance)
            } else {
                return nil // Skip professionals with unknown distance
            }
        }
        
        // Sort professionals based on distance
        let sortedProfessionals = professionalsWithDistance.sorted { $0.1 < $1.1 }
        
        // Take the closest 4 professionals
        let closestProfessionals = sortedProfessionals.prefix(4).map { $0.0 }
        
        return closestProfessionals.isEmpty ? nil : closestProfessionals
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
