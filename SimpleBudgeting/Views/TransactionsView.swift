//
//  TransactionsView.swift
//  SimpleBudgeting
//
//  Created by Roi Jacob C. Olfindo on 1/24/24.
//

import SwiftUI

struct TransactionsView: View {
    @ObservedObject var viewModel: FirestoreViewModel

    var body: some View {
        List(viewModel.messages, id: \.self) { message in
            VStack(alignment: .leading) {
                Text("Expense: \(message.text)")
                Text("Cost: \(message.price)")
            }
        }
        .onAppear {
            viewModel.fetchData()
        }
    }
}
