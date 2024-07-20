//
//  SwiftUIToDoAppApp.swift
//  SwiftUIToDoApp
//
//  Created by Harun AYDIN on 8.07.2024.
//
/*import SwiftUI
import Firebase

@main
struct SwiftUIToDoApp: App {
    // AppDelegate'i kullanmak için bu satırı ekleyin
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}*/

import SwiftUI
import FirebaseCore

@main
struct SwiftUIToDoApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}






