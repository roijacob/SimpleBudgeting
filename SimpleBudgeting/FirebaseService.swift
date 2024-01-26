////
////  FirebaseService.swift
////  SimpleBudgeting
////
////  Created by Roi Jacob C. Olfindo on 1/26/24.
////
//
//
//import FirebaseFirestore
//
//class FirebaseService {
//    private let db = Firestore.firestore()
//
//    func addNamePriceEntry(_ entry: NamePriceEntry) {
//        db.collection("entries").addDocument(data: [
//            "id": entry.id.uuidString,
//            "name": entry.name,
//            "price": entry.price,
//            "category": entry.category,
//            "subCategory": entry.subCategory,
//            "note": entry.note,
//        ]) { error in
//            if let error = error {
//                print("Error adding document: \(error)")
//            } else {
//                print("Document added successfully")
//            }
//        }
//    }
//
//    func getEntries(completion: @escaping ([NamePriceEntry]) -> Void) {
//        db.collection("entries").getDocuments { (querySnapshot, err) in
//            if let err = err {
//                print("Error getting documents: \(err)")
//                completion([])
//            } else {
//                var entries: [NamePriceEntry] = []
//                for document in querySnapshot!.documents {
//                    let data = document.data()
//                    if let name = data["name"] as? String,
//                       let price = data["price"] as? String,
//                       let category = data["category"] as? String,
//                       let subCategory = data["subCategory"] as? String,
//                       let note = data["note"] as? String {
//                        let entry = NamePriceEntry(name: name, price: price, category: category, subCategory: subCategory, note: note)
//                        entries.append(entry)
//                    }
//                }
//                completion(entries)
//            }
//        }
//    }
//}
