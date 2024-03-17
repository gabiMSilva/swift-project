//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by Gabriela Medeiros da Silva on 14/03/24.
//

import SwiftUI

@main
struct LandmarksApp: App {
    @State private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(modelData)
        }
    }
}
