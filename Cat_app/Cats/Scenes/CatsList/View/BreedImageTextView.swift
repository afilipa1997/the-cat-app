//
//  CatImageView.swift
//  Cats
//
//  Created by Oliveira, Ana Filipa on 15/06/2024.
//

import SwiftUI

struct BreedImageTextView: View {
    let url: URL?
    let breedName: String
    @State var isFavorite: Bool
    @ObservedObject var viewModel: CatsListViewModel
    
    var body: some View {
        VStack(alignment: .center) {
            AsyncImage(url: url, scale: 1) { phase in
                switch phase {
                case .empty:
                    ZStack {
                        Color.gray
                        ProgressView()
                    }
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 200, 
                               height: 200)
                        .clipped()
                case .failure(let error):
                    ZStack {
                        Color.red
                        Text(error.localizedDescription)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                    }
                @unknown default:
                    EmptyView()
                }
            }
            Button(action: {
                // Toggle the favorite state to change UI
                isFavorite.toggle()
                
                //update favorite state in database
                viewModel.toggleFavorite(for: breedName)
                
                
            }) {
                Image(systemName: isFavorite ? "star.fill" : "star")
                    .foregroundColor(isFavorite ? .yellow : .gray)
            }
            Text(breedName).font(.subheadline)
        }
        .cornerRadius(8)
        .shadow(radius: 4)
    }
}
