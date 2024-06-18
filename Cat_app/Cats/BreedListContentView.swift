//
//  ContentView.swift
//  Cat_app
//
//  Created by Oliveira, Ana Filipa on 14/06/2024.
//

import SwiftUI
import CoreData

struct BreedListContentView: View {
    @StateObject private var viewModel = CatsListViewModel()
    
    private let columns = [
        GridItem(.adaptive(minimum: 50), spacing: 20),
        GridItem(.adaptive(minimum: 50), spacing: 20),
        GridItem(.adaptive(minimum: 50), spacing: 20)
    ]
    
    var body: some View {
        NavigationView {
            VStack {
                if viewModel.isLoading {
                    ProgressView("Loading .....")
                } else if let error = viewModel.error {
                    Text("Error: \(error.localizedDescription)")
                        .foregroundColor(.blue)
                } else {
                    ScrollView {
                        LazyVGrid(columns: columns, spacing: 20) {
                            ForEach(viewModel.cats.filter{ $0.breedImageURL != nil },
                                    id: \.id) { cat in
                                BreedImageTextView(url: cat.breedImageURL,
                                                   breedName: cat.breedName,
                                                   isFavorite: cat.isFavourite,
                                                   viewModel: viewModel)
                            }
                        }
                        .padding(.horizontal)
                    }
                }
            }
            .navigationTitle("Breed List")
            .onAppear {
                viewModel.fetchCats()
            }
        }
    }
}
