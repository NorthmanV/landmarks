//
//  ContentView.swift
//  Landmarks
//
//  Created by Ruslan Akberov on 31.05.2024.
//

import SwiftUI

struct ContentView: View {
    enum Tab {
        case featured
        case list
    }
    
    @State private var selection: Tab = .featured
    
    var body: some View {
        TabView(selection: $selection) {
            CategoryHome()
                .tabItem {
                    Label("Featured", systemImage: "star")
                }
                .tag(Tab.featured)
            
            LandmarkList()
                .tabItem {
                    Label("List", systemImage: "list.bullet")
                }
                .tag(Tab.list)
        }
    }
}

#Preview {
    ContentView()
        .environment(ModelData())
}
