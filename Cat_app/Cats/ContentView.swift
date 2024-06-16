//
//  ContentView.swift
//  Cat_app
//
//  Created by Oliveira, Ana Filipa on 14/06/2024.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @StateObject private var viewModel = CatsListViewModel()
    
    private let columns = [
        GridItem(.adaptive(minimum: 50), spacing: 20),
        GridItem(.adaptive(minimum: 50), spacing: 20),
        GridItem(.adaptive(minimum: 50), spacing: 20)
        ]
    
    var body: some View {
        NavigationView {
            Group {
                if viewModel.isLoading {
                    ProgressView("Loading...")
                } else if let error = viewModel.error {
                    Text("Error: \(error.localizedDescription)")
                        .foregroundColor(.blue)
                } else {
                    ScrollView {
                        LazyVGrid(columns: columns, spacing: 20) {
                            ForEach(viewModel.cats, id: \.id) { cat in
                                CatImageView(url: cat.url)
                            }
                        }
                    }
                }
            }
        }
        .onAppear {
            viewModel.fetchCats()
        }
    }
}
