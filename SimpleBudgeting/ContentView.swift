//
//  ContentView.swift
//  SimpleBudgeting
//
//  Created by Roi Jacob C. Olfindo on 1/24/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var authManager = AuthManager()

    var body: some View {
        if authManager.isAuthenticated {
            // Main Tab View
            MainTabView(authManager: authManager)
        } else {
            // Login View
            LoginView(authManager: authManager)
        }
    }
}

struct MainTabView: View {
    @ObservedObject var authManager: AuthManager
    @AppStorage("themeSetting") private var themeSetting = ThemeSetting.system.rawValue

    var body: some View {
        TabView {
            HomeView()
                .tabItem { Label("Home", systemImage: "house") }
            TransactionsView()
                .tabItem { Label("Transaction", systemImage: "arrow.2.circlepath") }
            SettingsView(authManager: authManager)
                .tabItem { Label("Settings", systemImage: "gear") }
        }
        .colorScheme(colorScheme) // Applying the color scheme to the TabView
    }

    // This should be outside the 'var body: some View' block
    private var colorScheme: ColorScheme {
        switch themeSetting {
        case ThemeSetting.light.rawValue:
            return .light
        case ThemeSetting.dark.rawValue:
            return .dark
        default:
            return .light
        }
    }
}



//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}


#Preview {
    ContentView()
}
