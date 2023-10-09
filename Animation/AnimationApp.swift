//
//  AnimationApp.swift
//  Animation
//
//  Created by Валерий Никитин on 09.10.2023.
//

import SwiftUI
import Firebase

@main
struct AnimationApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            CustomTabView() // Изменено с ContentView() на CustomTabView()
        }
    }
}
