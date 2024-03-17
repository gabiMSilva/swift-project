//
//  FavoriteButton.swift
//  Landmarks
//
//  Created by Gabriela Medeiros da Silva on 17/03/24.
//

import SwiftUI

struct FavoriteButton: View {
    @Binding var isActive: Bool
    
    var body: some View {
        Button {
            isActive.toggle()
        } label: {
            Label("Toggle Favorite", systemImage: isActive ? "star.fill" : "star")
                .labelStyle(.iconOnly)
                .foregroundStyle(.yellow)
        }
    }
}

#Preview {
    FavoriteButton(isActive: .constant(false))
}
