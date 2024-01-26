////
////  AddRecordView.swift
////  SimpleBudgeting
////
////  Created by Roi Jacob C. Olfindo on 1/26/24.
////
//
//import SwiftUI
//
//struct AddRecordView: View {
//    @Binding var entries: [NamePriceEntry]
//    @Binding var isPresented: Bool
//    @State private var currentName: String = ""
//    @State private var price: String = ""
//    @State private var category: String = ""
//    @State private var subCategory: String = ""
//    @State private var note: String = ""
//    
//    var body: some View {
//        NavigationView {
//            Form {
//                Section(header: Text("New Entry")) {
//                    TextField("Enter your name", text: $currentName)
//                    TextField("Enter price", text: $price)
//                        .keyboardType(.decimalPad)
//                    Picker("Category", selection: $category) {
//                        Text("Linnies").tag("Linnies")
//                        Text("Tucker").tag("Tucker")
//                        Text("Ming-Ming").tag("Ming-Ming")
//                    }
//                    Picker("Sub-category", selection: $subCategory) {
//                        Text("Linnies").tag("Linnies")
//                        Text("Tucker").tag("Tucker")
//                        Text("Ming-Ming").tag("Ming-Ming")
//                    }
//                    TextField("Note", text: $note)
//                }
//                Button("Add Record") {
//                    let entry = NamePriceEntry(name: currentName, price: price, category: category, subCategory: subCategory, note: note)
//                    // Add to Firebase or entries array here
//                    // For example:
//                    // FirebaseService().addNamePriceEntry(entry)
//                    // entries.append(entry)
//                    
//                    // Reset fields
//                    currentName = ""
//                    price = ""
//                    category = "Linnies"
//                    subCategory = "Linnies"
//                    note = ""
//                    isPresented = false
//
//                }
//            }
//            .navigationBarTitle("Add New Entry", displayMode: .inline)
//        }
//    }
//}
