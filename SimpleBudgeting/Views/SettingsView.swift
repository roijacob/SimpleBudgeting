//
//  SettingsView.swift
//  SimpleBudgeting
//
//  Created by Roi Jacob C. Olfindo on 1/24/24.
//

import SwiftUI

enum ThemeSetting: String, CaseIterable {
    case light = "Light"
    case dark = "Dark"
    case system = "System"
}

struct SettingsView: View {
    @ObservedObject var authManager: AuthManager
    @AppStorage("themeSetting") private var themeSetting = ThemeSetting.system.rawValue
    @AppStorage("emailNotificationsEnabled") private var emailNotificationsEnabled = false

    var body: some View {
        NavigationView {
            VStack {
                Picker("Theme", selection: $themeSetting) {
                    ForEach(ThemeSetting.allCases, id: \.self) { setting in
                        Text(setting.rawValue).tag(setting.rawValue)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                
                Toggle("Include Sub-Categories", isOn: $emailNotificationsEnabled)
                    .padding()

                Spacer()

                Button(action: {
                    authManager.signOut() // Call the signOut function from AuthManager
                }) {
                    Text("Log Out")
                        .foregroundColor(.red)
                }
                .padding()
            }
            .padding()
            .navigationTitle("Settings")
        }
    }
}



//
//#Preview {
//    SettingsView()
//}
