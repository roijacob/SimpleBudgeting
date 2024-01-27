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
            MainTabView(authManager: authManager)
        } else {
            LoginView(authManager: authManager)
        }
    }
}

struct MainTabView: View {
    var firestoreVM = FirestoreViewModel()
    
    @ObservedObject var authManager: AuthManager
    
    @AppStorage("themeSetting") private var themeSetting = ThemeSetting.system.rawValue
    
    var body: some View {
        TabView {
            HomeView(viewModel: firestoreVM)
                .tabItem { Label("Home", systemImage: "house") }
            TransactionsView(viewModel: firestoreVM)
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


#Preview {
    ContentView()
}
