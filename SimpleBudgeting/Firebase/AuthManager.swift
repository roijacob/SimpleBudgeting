//
//  AuthManager.swift
//  SimpleBudgeting
//
//  Created by Roi Jacob C. Olfindo on 1/24/24.
//

import FirebaseAuth

class AuthManager: ObservableObject {
    @Published var isAuthenticated: Bool = false
    @Published var errorMessage: String? // For storing the error message


    init() {
        isAuthenticated = Auth.auth().currentUser != nil
    }

    func loginUser(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            if let error = error {
                self?.errorMessage = error.localizedDescription
                return
            }
            self?.isAuthenticated = true
            self?.errorMessage = nil // Clear any previous error
        }
    }

    func signUpUser(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] authResult, error in
            if let error = error {
                self?.errorMessage = error.localizedDescription
                return
            }
            self?.isAuthenticated = true
            self?.errorMessage = nil // Clear any previous error
        }
    }

    func signOut() {
        try? Auth.auth().signOut()
        isAuthenticated = false
    }
}
