//
//  HomeView.swift
//  SimpleBudgeting
//
//  Created by Roi Jacob C. Olfindo on 1/24/24.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel: FirestoreViewModel
    @State private var showingInputView = false // To control sheet presentation

    var body: some View {
        VStack {
            // Your existing content
            Spacer()
            Button("Add") {
                showingInputView = true
            }
            .padding()
        }
        .sheet(isPresented: $showingInputView) {
            InputView(viewModel: viewModel, isPresented: $showingInputView)
        }
    }
}

//
//struct HomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeView(names: $names)
//    }
//}
