//
//  RecipeImageView.swift
//  Recipes
//
//  Created by Summer Crow on 2022-06-12.
//

import SwiftUI



struct RecipeImageView: View {
    
    @StateObject var vm: RecipeImageViewModel
    
    init(recipe: Recipe) {
        _vm = StateObject(wrappedValue: RecipeImageViewModel(recipe: recipe))
    }
    
    var body: some View {
        ZStack {
            if let image = vm.image {
                Image(uiImage: image)
                    .resizable()
                
                    
            } else if vm.isLoading {
                ProgressView()
            } else {
                Image(systemName: "questionmark")
                    .foregroundColor(Color.theme.secondaryText)
            }
        }
    }
}

struct RecipeImageView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeImageView(recipe: dev.recipe)
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
