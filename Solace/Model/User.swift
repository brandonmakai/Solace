//
//  User.swift
//  Solace
//
//  Created by Brandon Williams on 3/15/24.
//

import SwiftUI
import CoreLocation

class UserView: Identifiable, ObservableObject {
    
    struct User {
        let id: UUID
        let name: String
        let icon: String
        let currentLocation: CLLocationCoordinate2D
        let preferences: Preference? = nil
    }
    
    struct Preference {
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
    
    static let MOCKUSER = User(id: UUID(), name: "Brandin", icon: "placeholder", currentLocation: CLLocationCoordinate2D(latitude: 34.56, longitude: 56.56))
    
    func distanceBetween(user: User, professional: ProfessionalView.Professional) -> Int {
        let userLocation = CLLocation(latitude: user.currentLocation.latitude, longitude: user.currentLocation.longitude)
        let professionalLocation = CLLocation(latitude: professional.location.latitude, longitude: professional.location.longitude)
        let distanceMeters = userLocation.distance(from: professionalLocation)
        let distanceMiles = distanceMeters * 0.000621371
        let roundedMileDistance = Int(distanceMiles.rounded())
        return roundedMileDistance
    }
}
