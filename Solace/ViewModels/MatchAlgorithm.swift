//
//  MatchAlgorithm.swift
//  Solace
//
//  Created by Brandon Williams on 3/16/24.
//

import SwiftUI
import CoreLocation

func findMatches(users: [UserView.User], professionals: [ProfessionalView.Professional]) -> [(UserView.User, ProfessionalView.Professional)] {
    var matches: [(UserView.User, ProfessionalView.Professional)] = []
    
    for user in users {
        var bestMatch: ProfessionalView.Professional?
        var maxScore = 0
        
        for professional in professionals {
            // Calculate recommendation score for user-professional pair
            let score = recommendationScore(user: user, professional: professional)
            
            // Check if score is higher than current best match
            if score > maxScore {
                maxScore = score
                bestMatch = professional
            }
        }
        
        if let bestMatch = bestMatch {
            matches.append((user, bestMatch))
        }
    }
    
    return matches
}


func recommendationScore(user: UserView.User, professional: ProfessionalView.Professional) -> Int {
    var score = 0
    
    // Check if preferences align
    let userGeneralPreferences = user.preferences?.general ?? .anxietyStress
    
    switch userGeneralPreferences {
    case .anxietyStress, .depression, .trauma:
        if professional.profession == .therapist ||
           professional.profession == .psychiatrists ||
           professional.profession == .psychologists {
            score += 3
        }
    case .prescription:
        if professional.profession == .psychiatrists {
            score += 3
        }
    }
    
    // Increase score based on other preferences
    if user.preferences?.location == UserView.LocationPreference.none || user.preferences?.location.rawValue == professional.meeting.rawValue {
        score += 1
    }
    
    if user.preferences?.religion.rawValue == professional.religion.rawValue || professional.religion == .none {
        score += 1
    }
    
    // TODO: Implement for No Preferences
    if user.preferences?.gender.rawValue == professional.gender.rawValue {
        score += 1
    }
    
    return score
}



