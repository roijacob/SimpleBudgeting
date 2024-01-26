//
//  DataManager.swift
//  SimpleBudgeting
//
//  Created by Roi Jacob C. Olfindo on 1/26/24.
//

import Foundation

import FirebaseFirestore
//
//struct User: Identifiable, Codable {
//    var userName: String
//    var userPrice: String
//    var userCategory: String
//    var userSubcategory: String
//    var userAccount: String
//    var userNote: String
//    
//    // Comment 1
//    @DocumentID var id: String?
//
//    // Comment 2
//    var dictionary: [String: Any] {
//        return ["name": userName,
//                "price": userPrice,
//                "category": userCategory,
//                "subcategory": userSubcategory,
//                "account": userAccount,
//                "note": userNote]
//    }
//}

class FirestoreViewModel: ObservableObject {
    private var db = Firestore.firestore()
    @Published var errorMessage: String? // Add this variable
    @Published var messages: [String] = []

    
    // Comment 3
//    @Published var users: [User] = []
    
    // Comment 4
    func saveMessage(_ message: String) {
        let newMessage = ["text": message, "timestamp": Timestamp()] as [String : Any]
        db.collection("messages").addDocument(data: newMessage)
    }
    
//    func saveData(name: String, price: String,
//                  category: String, subcategory:
//                  String, account: String, note: String) {
//        let newUser = User(userName: name, userPrice: price, userCategory: category, userSubcategory: subcategory, userAccount: account, userNote: note)
//        db.collection("users").addDocument(data: newUser.dictionary)
//    }
    
    func fetchData() {
        db.collection("messages").order(by: "timestamp", descending: true).getDocuments { [weak self] (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                self?.messages = querySnapshot?.documents.compactMap { documentSnapshot in
                    documentSnapshot.get("text") as? String
                } ?? []
            }
        }
    }
}

    
    
//    func fetchData() {
//        db.collection("users").getDocuments { [weak self] (querySnapshot, err) in
//            if let err = err {
//                print("Error getting documents: \(err)")
//            } else {
//                self?.users = querySnapshot?.documents.compactMap { documentSnapshot in
//                    return try? documentSnapshot.data(as: User.self)
//                } ?? []
//            }
//        }
//    }
//}
    
    
//    // Comment 5
//    func fetchData() {
//        db.collection("users").getDocuments { [weak self] (querySnapshot, err) in
//            if let err = err {
//                print("Error getting documents: \(err)")
//            } else {
//                self?.users = querySnapshot?.documents.compactMap { documentSnapshot in
//                    
//                    // Comment 6
//                    var user = try? documentSnapshot.data(as: User.self)
//                    
//                    user?.userName = documentSnapshot.get("name") as? String ?? ""
//                    user?.userPrice = documentSnapshot.get("price") as? String ?? ""
//                    user?.userCategory = documentSnapshot.get("category") as? String ?? ""
//                    user?.userSubcategory = documentSnapshot.get("subcategory") as? String ?? ""
//                    user?.userAccount = documentSnapshot.get("account") as? String ?? ""
//                    user?.userNote = documentSnapshot.get("note") as? String ?? ""
//
//                    return user
//                } ?? []
//            }
//        }
//    }
//}
