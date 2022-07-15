//
//  RecipeImageViewModel.swift
//  Recipes
//
//  Created by Summer Crow on 2022-06-13.
//

import Foundation
import SwiftUI
import Combine

class RecipeImageViewModel: ObservableObject {
    
    @Published var image: UIImage? = nil
    @Published var isLoading: Bool = false
    
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
                self?.image = returnedImage
            }
            .store(in: &cancellables)

    }
}
