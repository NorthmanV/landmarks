//
//  MapView.swift
//  Landmarks
//
//  Created by Ruslan Akberov on 02.06.2024.
//

import SwiftUI
import MapKit

struct MapView: View {
    let coordinate: CLLocationCoordinate2D
    
    @AppStorage("MapView.zoom")
    private var zoom: Zoom = .medium
    
    private var region: MKCoordinateRegion{
        MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: zoom.delta, longitudeDelta: zoom.delta)
        )
    }
    
    var body: some View {
        Map(position: .constant(.region(region)))
    }
}

extension MapView {
    
    enum Zoom: String, CaseIterable, Identifiable {
        case near = "Near"
        case medium = "Medium"
        case far = "Far"
        
        var id: Zoom {
            self
        }
        
        var delta: CLLocationDegrees {
            switch self {
            case .near: return 0.02
            case .medium: return 0.2
            case .far: return 2
            }
        }
    }
}

#Preview {
    MapView(coordinate: CLLocationCoordinate2D(
        latitude: 34.011286,
        longitude: -116.166868
    ))
}
