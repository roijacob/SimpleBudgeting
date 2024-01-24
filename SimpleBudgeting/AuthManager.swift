//
//  AuthManager.swift
//  SimpleBudgeting
//
//  Created by Roi Jacob C. Olfindo on 1/24/24.
//

import FirebaseAuth

class AuthManager: ObservableObject {
    @Published var isAuthenticated: Bool = false

    init() {
        isAuthenticated = Auth.auth().currentUser != nil
    }

    func loginUser(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            if let error = error {
                print("Login error: \(error.localizedDescription)")
                return
            }
            self?.isAuthenticated = true
        }
    }

    func signOut() {
        try? Auth.auth().signOut()
        isAuthenticated = false
    }
}
