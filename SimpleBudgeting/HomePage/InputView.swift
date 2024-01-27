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

    // State variables for user inputs
    @State private var inputName: String = ""
    @State private var inputPrice: String = ""
    @State private var inputCategory: String = "Food"
    @State private var inputSubcategory: String = "Evening"
    @State private var inputDate = Date()
    @State private var inputAccount: String = "Evening"
    @State private var inputNote: String = ""

    // Constants for picker options
    let categories = ["Food", "Transportation", "Bills"]
    let subcategories = ["Morning", "Afternoon", "Evening"]
    let accounts = ["Cash", "GCash", "AMEX"]

    var body: some View {
        NavigationView {
            VStack {
                titleText
                datePicker
                inputForm
                saveButton
            }
        }
    }

    // MARK: - View Components

    private var titleText: some View {
        Text("Enter Your Record")
            .font(.largeTitle)
            .fontWeight(.bold)
            .foregroundColor(Color.blue)
            .padding(.top, 20)
    }

    private var datePicker: some View {
        DatePicker("Select a Date", selection: $inputDate, displayedComponents: .date)
            .padding()
    }

    private var inputForm: some View {
        Form {
            TextField("Enter your name", text: $inputName)
            TextField("Enter your price", text: $inputPrice)

            Picker("Category", selection: $inputCategory) {
                ForEach(categories, id: \.self) { category in
                    Text(category).tag(category)
                }
            }

            Picker("Subcategory", selection: $inputSubcategory) {
                ForEach(subcategories, id: \.self) { subcategory in
                    Text(subcategory).tag(subcategory)
                }
            }

            Picker("Account", selection: $inputAccount) {
                ForEach(accounts, id: \.self) { account in
                    Text(account).tag(account)
                }
            }

            TextField("Additional Notes!", text: $inputNote)
        }
    }

    private var saveButton: some View {
        Button("Save to Firestore") {
            viewModel.saveMessage(inputName, price: inputPrice, category: inputCategory,
                                  subcategory: inputSubcategory, note: inputNote, date: inputDate, account: inputAccount)
            resetInputFields()
        }
    }

    // MARK: - Helper Methods

    private func resetInputFields() {
        inputName = ""
        inputPrice = ""
        inputNote = ""
        isPresented = false
    }
}
