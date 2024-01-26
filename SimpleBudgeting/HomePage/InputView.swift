//
//  InputView.swift
//  SimpleBudgeting
//
//  Created by Roi Jacob C. Olfindo on 1/26/24.
//

import SwiftUI

struct InputView: View {
    @ObservedObject var viewModel: FirestoreViewModel
    @Binding var isPresented: Bool
    @State private var inputName: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Enter Your Record")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color.blue)
                    .padding(.top, 20)
                
                Form {
                    TextField("Enter your name", text: $inputName)
                }
                
                Button("Save to Firestore") {
                    viewModel.saveMessage(inputName)
                    inputName = "" // Reset the input field after saving
                }
                
//                Button("Save") {
//                    viewModel.saveData(name: inputName)
//                    isPresented = false // Dismiss the sheet after saving
//                }
            }
        }
    }
}



//
//struct InputView: View {
//    @ObservedObject var viewModel: FirestoreViewModel
//    @Binding var isPresented: Bool
//    @State private var inputName: String = ""
//    @State private var inputPrice: String = ""
//    @State private var inputCategory: String = "Food"
//    @State private var inputSubcategory: String = "Evening"
//    @State private var inputAccount: String = "AMEX"
//    @State private var inputNote: String = ""
//    
//    let categories = ["Food", "Transportation", "Bills"]
//    let subcategories = ["Morning", "Afternoon", "Evening"]
//    let accounts = ["Cash", "GCash", "AMEX"]
//    
//    var body: some View {
//        NavigationView {
//            VStack {
//                Text("Enter Your Record")
//                    .font(.largeTitle) // Large font size for titles
//                    .fontWeight(.bold) // Bold font weight
//                    .foregroundColor(Color.blue) // Text color
//                    .padding(.top, 20) // Spacing from the text to the form
//                
//                Form {
//                    TextField("Enter your name", text: $inputName)
////                    TextField("Enter price", text: $inputPrice)
////                    
////                    Picker("Category", selection: $inputCategory) {
////                        ForEach(categories, id: \.self) { category in
////                            Text(category).tag(category)
////                        }
////                    }
////                    .pickerStyle(MenuPickerStyle()) // You can choose the picker style
////                    
////                    Picker("Subcategory", selection: $inputSubcategory) {
////                        ForEach(subcategories, id: \.self) { subcategory in
////                            Text(subcategory).tag(subcategory)
////                        }
////                    }
////                    .pickerStyle(MenuPickerStyle()) // You can choose the picker style
////                    
////                    Picker("Account", selection: $inputAccount) {
////                        ForEach(accounts, id: \.self) { account in
////                            Text(account).tag(account)
////                        }
////                    }
////                    .pickerStyle(MenuPickerStyle()) // You can choose the picker style
////                    
////                    TextField("Additional Notes", text: $inputNote)
////                }
////                
//                
//                Button("Save") {
//                    viewModel.saveData(name: inputName, price: inputPrice, category: inputCategory, subcategory: inputSubcategory, account: inputAccount, note: inputNote)
//                    isPresented = false // Dismiss the sheet after saving
//                }
//            }
//        }
//    }
//}
