//
//  prueba_intermediaApp.swift
//  prueba_intermedia
//
//  Created by Renato Baeza on 2024-12-10.
//

import SwiftUI

@main
struct prueba_intermediaApp: App {
    @AppStorage("currentScreen") var currentScreen: String = "welcome"
    
    var body: some Scene {
        WindowGroup {
            if currentScreen == "welcome" {
                WelcomeView()
            } else {
                WelcomeView()
                    .onAppear {
                        currentScreen = "welcome"
                    }
            }
        }
    }
}
