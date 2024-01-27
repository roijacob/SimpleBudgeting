//
//  DataManager.swift
//  SimpleBudgeting
//
//  Created by Roi Jacob C. Olfindo on 1/26/24.
//

import SwiftUI
import FirebaseFirestore
import FirebaseAuth

class FirestoreViewModel: ObservableObject {
    private var db = Firestore.firestore()
    @Published var errorMessage: String?
    @Published var messages: [Message] = []
    
    // Saves a new message to Firestore
    // Updates the saveMessage function to include date and account
    func saveMessage(_ message: String, price: String, category: String, subcategory: String, note: String, date: Date, account: String) {
        guard let userID = Auth.auth().currentUser?.uid else {
            self.errorMessage = "User not authenticated"
            return
        }
        
        let newMessage = [
            "text": message,
            "price": price,
            "category": category,
            "subcategory": subcategory,
            "note": note,
            "timestamp": Timestamp(),
            "date": date,
            "account": account,
            "userID": userID  // Include the user ID
        ] as [String : Any]
        
        db.collection("messages").addDocument(data: newMessage) { error in
            if let error = error {
                self.errorMessage = "Error saving message: \(error.localizedDescription)"
                print(self.errorMessage ?? "")
            }
        }
    }
    
    
    // Fetches messages from Firestore
    func fetchData() {
        guard let userID = Auth.auth().currentUser?.uid else {
            self.errorMessage = "User not authenticated"
            return
        }
        
        db.collection("messages")
            .whereField("userID", isEqualTo: userID)
            .order(by: "timestamp", descending: true)
            .getDocuments { [weak self] (querySnapshot, err) in
                if let err = err {
                    self?.errorMessage = "Error fetching messages: \(err.localizedDescription)"
                    print(self?.errorMessage ?? "")
                } else {
                    self?.messages = querySnapshot?.documents.compactMap { Message(document: $0) } ?? []
                }
            }
    }
}
