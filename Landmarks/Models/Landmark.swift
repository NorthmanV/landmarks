//
//  Landmark.swift
//  Landmarks
//
//  Created by Ruslan Akberov on 02.06.2024.
//

import Foundation
import SwiftUI
import CoreLocation

struct Landmark: Hashable, Codable, Identifiable {
    let id: Int
    let name: String
    let park: String
    let state: String
    let description: String
    var isFavorite: Bool
    var isFeatured: Bool
    var category: Category
    
    var image: Image {
        Image(imageName)
    }
    
    var featureImage: Image? {
        isFeatured ? Image(imageName + "_feature") : nil
    }
    
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude
        )
    }
    
    private let imageName: String
    private let coordinates: Coordinates
}

extension Landmark {
    
    struct Coordinates: Hashable, Codable {
        let latitude: Double
        let longitude: Double
    }

    enum Category: String, CaseIterable, Codable {
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"
    }
}
