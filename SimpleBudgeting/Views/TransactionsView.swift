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
            Text(message)
        }
        .onAppear {
            viewModel.fetchData()
        }
    }
}


//
//struct TransactionsView: View {
//    @ObservedObject var viewModel: FirestoreViewModel
//
//    var body: some View {
//        VStack {
//            Text("Bumalik ka na saken!")
//            Text("Bessy Love You!")
//            
//            List(viewModel.users) { user in
//                VStack(alignment: .leading) {
//                    Text("Name: \(user.userName)")
//                    Text("Cost: \(user.userCategory)")
//                }
//            }
//            .onAppear {
//                viewModel.fetchData()
//            }
//        }
//    }
//}


//
//struct TransactionsView_Previews: PreviewProvider {
//    static var previews: some View {
//        TransactionsView()
//    }
//}
