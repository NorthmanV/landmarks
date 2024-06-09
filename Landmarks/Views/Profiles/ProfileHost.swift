//
//  ProfileHost.swift
//  Landmarks
//
//  Created by Ruslan Akberov on 09.06.2024.
//

import SwiftUI

struct ProfileHost: View {
    @Environment(\.editMode) var editMode
    @Environment(ModelData.self) var modelData
    @State private var draftProfile = Profile.default
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                if editMode?.wrappedValue == .active {
                    Button("Cancel", role: .cancel) {
                        draftProfile = modelData.profile
                        editMode?.animation().wrappedValue = .inactive
                    }
                }
                Spacer()
                EditButton()
            }
            .padding(EdgeInsets(top: 15, leading: 15, bottom: -10, trailing: 15))

            if editMode?.wrappedValue == .inactive {
                ProfileSummary(profile: modelData.profile)
                    .padding()
            } else {
                ProfileEditor(profile: $draftProfile)
                // Обновляем модель только если изменения приняты (и сразу для всех полей)
                    .onAppear {
                        draftProfile = modelData.profile
                    }
                    .onDisappear {
                        modelData.profile = draftProfile
                    }
            }
        }
    }
}

#Preview {
    ProfileHost()
        .environment(ModelData())
}
