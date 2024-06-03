//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by Ruslan Akberov on 31.05.2024.
//

import SwiftUI

@main
struct LandmarksApp: App {
    @State private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(modelData)
        }
    }
}
