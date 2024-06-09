//
//  Profile.swift
//  Landmarks
//
//  Created by Ruslan Akberov on 09.06.2024.
//

import Foundation

struct Profile {
    var username: String
    var prefersNotification = true
    var seasonPhoto: Season = .winter
    var goalDate = Date()
    
    static let `default` = Profile(username: "John Smith")
}

extension Profile {
    
    enum Season: String, CaseIterable, Identifiable {
        case spring = "🌹"
        case summer = "☀️"
        case autumn = "🍁"
        case winter = "☃️"
        
        var id: String { rawValue }
    }
}
