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
            Spacer() // Pushes content to the middle
            
            Text("More features coming soon!")
                .font(.title)
                .fontWeight(.medium)
                .padding(.bottom, 20) // Adds space below the title

            Button("Add") {
                showingInputView = true
            }
            .padding()
            
            Spacer() // Continues to push content to the middle
        }
        .sheet(isPresented: $showingInputView) {
            InputView(viewModel: viewModel, isPresented: $showingInputView)
        }
    }
}
