//
//  NotificationView.swift
//  WatchLandmarks Watch App
//
//  Created by Ruslan Akberov on 11.06.2024.
//

import SwiftUI

struct NotificationView: View {
    let title: String?
    let message: String?
    let landmark: Landmark?
    
    var body: some View {
        VStack {
            if let landmark {
                CircleImage(image: landmark.image.resizable())
                    .scaledToFit()
            }
            Text(title ?? "Unknown Landmark")
            Divider()
            Text(message ?? "You are within 5 miles of one of your favorite landmarks")
                .font(.caption)
        }
    }
}

#Preview {
    NotificationView(
        title: "Turtle Rock",
        message: "You are within 5 miles of Turtle Rock",
        landmark: ModelData().landmarks.first
    )
}
