//
//  CategoryHome.swift
//  Landmarks
//
//  Created by Ruslan Akberov on 08.06.2024.
//

import SwiftUI

struct CategoryHome: View {
    @Environment(ModelData.self) var modelData
    @State private var showingProfile = false
    
    var body: some View {
        NavigationSplitView {
            List {
                PageView(
                    pages: modelData.features
                        .map { FeatureCard(landmark: $0) }
                )
                    .listRowInsets(.init())
                
                ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                    CategoryRow(
                        categoryName: key,
                        items: modelData.categories[key]!
                    )
                }
                .listRowInsets(.init())
            }
            .listStyle(.plain)
            .navigationTitle("Featured")
            .toolbar {
                Button {
                    showingProfile.toggle()
                } label: {
                    Label("User Profile", systemImage: "person.crop.circle")
                }
            }
            .sheet(isPresented: $showingProfile) {
                ProfileHost()
                    .environment(modelData)
            }
        } detail: {
            Text("Select a Landmark")
            // Помогает решить проблему с прыгающим navigation title
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    CategoryHome()
        .environment(ModelData())
}
