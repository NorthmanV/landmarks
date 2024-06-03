//
//  LandmarkRow.swift
//  Landmarks
//
//  Created by Ruslan Akberov on 02.06.2024.
//

import SwiftUI

struct LandmarkRow: View {
    let landmark: Landmark
    
    var body: some View {
        HStack {
            landmark.image
                .resizable()
                .scaledToFill()
                .frame(width: 50, height: 50)
                .clipped()
            Text(landmark.name)
            Spacer()
            if landmark.isFavorite {
                Image(systemName: "star.fill")
                    .symbolRenderingMode(.multicolor)
            }
        }
    }
}

#Preview {
    let landmarks = ModelData().landmarks
    return Group {
        LandmarkRow(landmark: landmarks[0])
        LandmarkRow(landmark: landmarks[1])
    }
}
