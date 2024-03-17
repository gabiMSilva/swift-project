//
//  LandmarkRow.swift
//  Landmarks
//
//  Created by Gabriela Medeiros da Silva on 14/03/24.
//

import SwiftUI

struct LandmarkRow: View {
    var landmark: Landmark
    
    var body: some View {
        HStack {
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)
            
            Text(landmark.name)
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    LandmarkRow(landmark: landmarks[0])
}

#Preview {
    LandmarkRow(landmark: landmarks[1])
}
