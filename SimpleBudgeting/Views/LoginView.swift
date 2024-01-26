//
//  LoginView.swift
//  SimpleBudgeting
//
//  Created by Roi Jacob C. Olfindo on 1/24/24.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var isSignup = false
    @ObservedObject var authManager: AuthManager // Change to ObservedObject

    var body: some View {
        VStack {
            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            if isSignup {
                Button("Sign Up") {
                    authManager.signUpUser(email: email, password: password)
                }
            } else {
                Button("Login") {
                    authManager.loginUser(email: email, password: password)
                }
            }

            if let errorMessage = authManager.errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .padding()
            }

            Button(isSignup ? "Already have an account? Log In" : "Don't have an account? Sign Up") {
                isSignup.toggle()
                authManager.errorMessage = nil // Clear error message when toggling
            }
            .padding()
        }
        .padding()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(authManager: AuthManager()) // Create an instance of AuthManager for the preview
    }
}
