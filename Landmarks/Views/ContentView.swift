//
//  ContentView.swift
//  Landmarks
//
//  Created by Ruslan Akberov on 31.05.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationSplitView {
            LandmarkList()
                .navigationTitle("Landmarks")
        } detail: {
            Text("Select a Landmark")
            // Помогает решить проблему с прыгающим navigation title
                .navigationBarTitleDisplayMode(.inline)
        }

    }
}

#Preview {
    ContentView()
        .environment(ModelData())
}
