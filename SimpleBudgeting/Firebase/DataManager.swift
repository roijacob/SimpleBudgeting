//
//  DataManager.swift
//  SimpleBudgeting
//
//  Created by Roi Jacob C. Olfindo on 1/26/24.
//

import Foundation

import FirebaseFirestore

struct Message: Hashable {
    var text: String
    var price: String
}

class FirestoreViewModel: ObservableObject {
    private var db = Firestore.firestore()
    @Published var errorMessage: String? // Add this variable
    @Published var messages: [Message] = []
    @Published var prices: [String] = []

    // Comment 4
    func saveMessage(_ message: String, price: String, category: String, subcategory: String) {
        let newMessage = ["text": message, "price": price, "category": category,
                          "subcategory": subcategory, "timestamp": Timestamp()] as [String : Any]
        db.collection("messages").addDocument(data: newMessage)
    }
        
    func fetchData() {
        db.collection("messages").order(by: "timestamp", descending: true).getDocuments { [weak self] (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                self?.messages = querySnapshot?.documents.compactMap { documentSnapshot in
                    let text = documentSnapshot.get("text") as? String ?? ""
                    let price = documentSnapshot.get("price") as? String ?? ""
                    return Message(text: text, price: price)
                } ?? []
            }
        }
    }
}

    

