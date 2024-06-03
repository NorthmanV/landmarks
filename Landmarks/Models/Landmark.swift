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
    
    var image: Image {
        Image(imageName)
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

}
