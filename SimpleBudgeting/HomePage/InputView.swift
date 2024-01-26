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
    @State private var inputPrice: String = ""
    @State private var inputCategory: String = "Food"
    @State private var inputSubcategory: String = "Evening"
    
    let categories = ["Food", "Transportation", "Bills"]
    let subcategories = ["Morning", "Afternoon", "Evening"]

    
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
                    TextField("Enter your price", text: $inputPrice)
                    
                    Picker("Category", selection: $inputCategory) {
                        ForEach(categories, id: \.self) { category in
                            Text(category).tag(category)
                        }
                    }
                    .pickerStyle(MenuPickerStyle()) // You can choose the picker style

                    Picker("Subcategory", selection: $inputSubcategory) {
                        ForEach(subcategories, id: \.self) { subcategory in
                            Text(subcategory).tag(subcategory)
                        }
                    }
                    .pickerStyle(MenuPickerStyle()) // You can choose the picker style
                    

                    
                }
                
                Button("Save to Firestore") {
                    viewModel.saveMessage(inputName, price: inputPrice, category: inputCategory, subcategory: inputSubcategory)
        
                    inputName = "" // Reset the input field after saving
                    isPresented = false // Dismiss the sheet after saving
                }
            }
        }
    }
}
