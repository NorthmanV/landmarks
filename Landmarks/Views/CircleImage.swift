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
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.white, lineWidth: 5)
            }
            .shadow(radius: 8)
    }
}

#Preview {
    let landmarks = ModelData().landmarks
    return CircleImage(image: landmarks[0].image)
}
