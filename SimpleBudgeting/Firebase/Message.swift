//
//  Message.swift
//  SimpleBudgeting
//
//  Created by Roi Jacob C. Olfindo on 1/27/24.
//

import FirebaseFirestore

struct Message: Hashable {
    var text: String
    var price: String
    var category: String
    var subcategory: String
    var note: String
    var timestamp: Date
    var date: Date
    var account: String
    
    // Comment 1
    var userID: String

    init?(document: DocumentSnapshot) {
        guard let text = document.get("text") as? String,
              let price = document.get("price") as? String,
              let category = document.get("category") as? String,
              let subcategory = document.get("subcategory") as? String,
              let userID = document.get("userID") as? String,
              let timestamp = (document.get("timestamp") as? Timestamp)?.dateValue(),
              let date = (document.get("date") as? Timestamp)?.dateValue() else {
            return nil
        }
        self.text = text
        self.price = price
        self.category = category
        self.subcategory = document.get("subcategory") as? String ?? "No Subcategory Provided (Disabled)"
        self.note = document.get("note") as? String ?? "No note provided"
        self.timestamp = timestamp
        self.date = date
        self.account = document.get("account") as? String ?? "Unknown Account"
        self.userID = userID
    }
}
