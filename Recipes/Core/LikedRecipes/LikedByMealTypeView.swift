//
//  LikedByMealTypeView.swift
//  Recipes
//
//  Created by Summer Crow on 2022-07-12.
//

import SwiftUI

struct LikedByMealTypeView: View {
    var title: String? 
    var recipes: [Recipe]?
    @State private var selectedRecipe: Recipe? = nil
    @State private var showDetailedView: Bool = false
    var body: some View {
        VStack(alignment: .leading) {
            if let title = title {
                Text(title.capitalized)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.leading)
            }
           
        if let recipes = recipes {
            List{
                ForEach(recipes) { recipe in
                    RecipeRowView(recipe: recipe)
                        .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
                        .onTapGesture {
                            segue(recipe: recipe)
                        }
                
                }
            }
            .listStyle(PlainListStyle())
        }
      
    }.background(
        NavigationLink(
            isActive: $showDetailedView,
            destination: {
                DetailedRecipeLoadingView(recipe: $selectedRecipe)
            },
            label: { EmptyView() })
    )
    }
}

struct LikedByMealTypeView_Previews: PreviewProvider {
    static var previews: some View {
        LikedByMealTypeView()
    }
}

extension LikedByMealTypeView {
    
    private func segue(recipe: Recipe) {
        selectedRecipe = recipe
        showDetailedView.toggle()
    }
}
