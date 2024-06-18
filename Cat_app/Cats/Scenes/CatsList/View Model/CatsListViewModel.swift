//
//  CatsListViewModel.swift
//  Cats
//
//  Created by Oliveira, Ana Filipa on 15/06/2024.
//

import Foundation
import Combine

class CatsListViewModel: ObservableObject {
    @Published var cats: [CatEntity] = []
    @Published var isLoading = false
    @Published var error: Error?
    
    private let useCase = CatsListUseCase(repository: CatsListRepository(remoteRepository: CatsListRemoteRepository(),
                                                                         storageRepository: CatsListStorageRepository()))
    
    init() {
        fetchCats()
    }
    
    func fetchCats() {
        isLoading = true
        error = nil
        Task {
            do {
                try await Task.sleep(nanoseconds: 3_000_000_000)
                let fetchedCats = try await useCase.fetchCatBreedsList()
                DispatchQueue.main.async {
                    self.cats = fetchedCats ?? []
                    self.isLoading = false
                }
            } catch {
                DispatchQueue.main.async {
                    self.error = error
                    self.isLoading = false
                }
            }
        }
    }
    
    func toggleFavorite(for breedName: String) {
        guard let index = cats.firstIndex(where: { $0.breedName == breedName }) else { return }
        var updatedCat = cats[index]
        updatedCat.isFavourite.toggle()
        try? useCase.updateFavouriteState(cat: updatedCat)
    }
}
