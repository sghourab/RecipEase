//
//  RecipeRowView.swift
//  Recipes
//
//  Created by Summer Crow on 2022-06-03.
//

import SwiftUI

struct RecipeRowView: View {
    
    let recipe: Recipe
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            
            recipeRowImageView
            
            VStack(alignment: .leading){
                Spacer()
                Text(recipe.name)
                    //.frame(maxWidth: .infinity)
                    //.frame(height: 20)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color.theme.secondaryText)
                    
                    .padding(.leading)
                    .padding(.bottom, 0)

            }
                     
        }
            
    }
}

struct RecipeRowView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeRowView(recipe: dev.recipe)
            .preferredColorScheme(.light)
            
    }
}

extension RecipeRowView {
    
    var recipeRowImageView: some View {
        RecipeImageView(recipe: recipe)
            
           .scaledToFill()
           .frame(width: 400, height: 250)
           .clipped()
            .frame(maxWidth: .infinity)
            .frame(height: 250)
            .overlay(LinearGradient(gradient: Gradient(colors: [.black.opacity(0), .black.opacity(0.7)]), startPoint: .top, endPoint: .bottom))
    }
}

