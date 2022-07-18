//
//  LikedRecipeView.swift
//  Recipes
//
//  Created by Summer Crow on 2022-07-07.
//

import SwiftUI
import Combine

class LikedRecipesViewModel: ObservableObject {

   // let savedRecipesCD = SavedRecipesDataService()
    @ObservedObject var homeVM = HomeViewModel()
   @Published var dataService = RecipeDataService()
   @Published var savedRecipes: [Recipe] = []
    @Published var savedRecipesArrangedByTags: [String: [Recipe]] = [MealTags.breakfast.rawValue: [], MealTags.lunch.rawValue: [], MealTags.dinner.rawValue: [], MealTags.desserts.rawValue: [], MealTags.snacks.rawValue: [], "sides And Appetizers": []]
    
    init(){
        self.getSavedRecipes()
    }

    func getSavedRecipes() {
 
        homeVM.retrieveSavedIDsFromCoreData()
        print("home saved = \(homeVM.savedRecipes)")
        dataService.getSavedRecipe(ids: homeVM.savedRecipeIDs) { recipes in
            print("saved recepies count == \(recipes?.count)")
            self.savedRecipes = recipes!
            self.arrangeRecipesByType2()
            
        }
    }
    enum MealTags: String {
        case breakfast
        case lunch
        case dinner
        case desserts
        case snacks
        case appetizers
        case sides
        
        
    }
    
    func arrangeRecipesByType2(){
       // print("called0")
        print("The count")
        print(savedRecipes.count)
    
        savedRecipesArrangedByTags = [MealTags.breakfast.rawValue: [], MealTags.lunch.rawValue: [], MealTags.dinner.rawValue: [], MealTags.desserts.rawValue: [], MealTags.snacks.rawValue: [], "sides And Appetizers": []]
    
        for recipe in savedRecipes {
            
            if let tags = recipe.tags {
             
                for tag in tags {
                  
                    if tag.name?.lowercased() == MealTags.breakfast.rawValue {
                        savedRecipesArrangedByTags[MealTags.breakfast.rawValue]?.append(recipe)
                        }
           
                    if tag.name?.lowercased() == MealTags.lunch.rawValue {
                            savedRecipesArrangedByTags[MealTags.lunch.rawValue]?.append(recipe)
                        }
                
                    if tag.name?.lowercased() == MealTags.dinner.rawValue {
                       
                            savedRecipesArrangedByTags[MealTags.dinner.rawValue]?.append(recipe)
                    }
                    if tag.name?.lowercased() == MealTags.desserts.rawValue {
                       
                            savedRecipesArrangedByTags[MealTags.desserts.rawValue]?.append(recipe)
                    }
                    if tag.name?.lowercased() == MealTags.snacks.rawValue {
                            savedRecipesArrangedByTags[MealTags.snacks.rawValue]?.append(recipe)
                        }
                    if tag.name?.lowercased() == MealTags.sides.rawValue || tag.name?.lowercased() == MealTags.appetizers.rawValue {
                       
                            savedRecipesArrangedByTags["sides And Appetizers"]?.append(recipe)
                   }
                }
            }
        }
    
    }

}

struct LikedRecipesView: View {
    
   

    
    @ObservedObject var vm: LikedRecipesViewModel

    var body: some View {
       ScrollView{
           VStack(alignment: .leading, spacing: 5) {
               
               myCookBooksTitle
               myCookBooksHScroll

               
           }.onAppear {
               getSavedRecpies()
           }
       }
    

    }
    
    func getSavedRecpies() {
        self.vm.getSavedRecipes()
    }
}

extension LikedRecipesView {
    
    var myCookBooksTitle: some View {
        Text("My Cookbooks")
            .font(.largeTitle)
            .fontWeight(.bold)
    }
    
    var myCookBooksHScroll: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            //if vm.showLikedView {
            HStack {
                ForEach(vm.savedRecipesArrangedByTags.sorted{$0.value.count > $1.value.count}, id: \.key) { key, value in
                
                if value.count > 0 {
                    NavigationLink {
                        LikedByMealTypeView(title: key, recipes: value)
                    } label: {
                        CookBookView(recipe: value[0], mealType: key.uppercased(), mealTypeCount: String(value.count))
                    }

                    
                } else {
                    CookBookView(recipe: nil, mealType: key.uppercased(), mealTypeCount: "No ")
                }
                
                    
            }
        }
   //     }
        }
    }
}
struct LikedRecipesView_Previews: PreviewProvider {
    static var previews: some View {
        LikedRecipesView(vm: LikedRecipesViewModel())
            
    }
}
