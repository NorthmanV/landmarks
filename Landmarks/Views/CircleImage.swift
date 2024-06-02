//
//  CircleImage.swift
//  Landmarks
//
//  Created by Ruslan Akberov on 02.06.2024.
//

import SwiftUI

struct CircleImage: View {
    let image: Image
    
    var body: some View {
        image
            .resizable()
            .scaledToFit()
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.white, lineWidth: 5)
            }
            .frame(width: 300, height: 300)
            .shadow(radius: 8)
    }
}

#Preview {
    CircleImage(image: landmarks[0].image)
}
