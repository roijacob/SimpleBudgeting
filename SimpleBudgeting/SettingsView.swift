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

    var body: some View {
        VStack {
            Picker("Theme", selection: $themeSetting) {
                ForEach(ThemeSetting.allCases, id: \.self) { setting in
                    Text(setting.rawValue).tag(setting.rawValue)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
        }
        .padding()
    }
}
//
//#Preview {
//    SettingsView()
//}
