//
//  LikedRecipesViewModel.swift
//  Recipes
//
//  Created by Summer Crow on 2022-07-25.
//

import Foundation
import SwiftUI
import Combine


class LikedRecipesViewModel: ObservableObject {


    @ObservedObject var homeVM = HomeViewModel()
    @Published var savedRecipesArrangedByTags: [String: [LikedRecipeModel]] = [MealTags.breakfast.rawValue: [], MealTags.lunch.rawValue: [], MealTags.dinner.rawValue: [], MealTags.desserts.rawValue: [], MealTags.snacks.rawValue: [], "sides And Appetizers": []]
    @Published var savedRecipes: [LikedRecipeModel] = []
    init(){
        self.getSavedRecipes()
      
    }

    func getSavedRecipes() {
       
        // New method new way
        
        let savedRecipesInCD = homeVM.savedRecipesDataService.savedRecipes
        for recipe in savedRecipesInCD {
            let tags = recipe.tags?.allObjects as! [Tags]
            var stringTags: [String] = []
            for tag in tags {
                print(tag.name)
                if let tagName = tag.name {
                stringTags.append(tagName)
                }
            }
            let savedRecipe = LikedRecipeModel(name: recipe.recipeName!, id: Int(recipe.recipeID), image: UIImage(data: recipe.image!)!, tags: stringTags)
            savedRecipes.append(savedRecipe)
            }
        arrangeRecipesByType2()
      //  }
    }

    
    func arrangeRecipesByType2(){
 

        savedRecipesArrangedByTags = [MealTags.breakfast.rawValue: [], MealTags.lunch.rawValue: [], MealTags.dinner.rawValue: [], MealTags.desserts.rawValue: [], MealTags.snacks.rawValue: [], "sides And Appetizers": []]

        for recipe in savedRecipes {


            for tag in recipe.tags {
                    
                    if tag.lowercased() == MealTags.breakfast.rawValue {
                        savedRecipesArrangedByTags[MealTags.breakfast.rawValue]?.append(recipe)
                        
                        }

                    if tag.lowercased() == MealTags.lunch.rawValue {
                            savedRecipesArrangedByTags[MealTags.lunch.rawValue]?.append(recipe)
                       
                        }

                    if tag.lowercased() == MealTags.dinner.rawValue {

                            savedRecipesArrangedByTags[MealTags.dinner.rawValue]?.append(recipe)
                    }
                    if tag.lowercased() == MealTags.desserts.rawValue {

                            savedRecipesArrangedByTags[MealTags.desserts.rawValue]?.append(recipe)
                    }
                    if tag.lowercased() == MealTags.snacks.rawValue {
                            savedRecipesArrangedByTags[MealTags.snacks.rawValue]?.append(recipe)
                        }
                    if tag.lowercased() == MealTags.sides.rawValue || tag.lowercased() == MealTags.appetizers.rawValue {

                            savedRecipesArrangedByTags["sides And Appetizers"]?.append(recipe)
                   }
            }
        }

    }

}
