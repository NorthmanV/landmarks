//
//  ContentView.swift
//  MacLandmarks
//
//  Created by Ruslan Akberov on 13.06.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList()
            .frame(minWidth: 700, minHeight: 300)
    }
}

#Preview {
    ContentView()
        .environment(ModelData())
}
