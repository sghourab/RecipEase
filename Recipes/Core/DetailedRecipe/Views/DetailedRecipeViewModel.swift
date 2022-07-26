//
//  DetailedRecipeViewModel.swift
//  Recipes
//
//  Created by Summer Crow on 2022-07-19.
//

import Foundation
import Combine
import SwiftUI

class DetailedRecipeViewModel: ObservableObject {
    
    @Published var isLoading: Bool = false
    @Published var imageData: Data? = nil
    
    private let recipe: Recipe
    private let dataService: RecipeImageService
    private var cancellables = Set<AnyCancellable>()
    
    init(recipe: Recipe){
        
        self.recipe = recipe
        self.dataService = RecipeImageService(recipe: recipe)
        
        addSubscribers()
        self.isLoading = true
    }
    
    private func addSubscribers(){
        dataService.$image
            .sink { [weak self] _ in
                self?.isLoading = false
            } receiveValue: { [weak self] (returnedImage) in
                self?.imageData = returnedImage?.jpegData(compressionQuality: 1.0)
            }
            .store(in: &cancellables)

    }
}
