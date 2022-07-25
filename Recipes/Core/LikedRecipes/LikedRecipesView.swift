//
//  LikedRecipeView.swift
//  Recipes
//
//  Created by Summer Crow on 2022-07-07.
//

import SwiftUI
import Combine

struct LikedRecipeModel: Identifiable {
    var name: String
    var id: Int
    var image: UIImage
    var tags: [String]
}

class LikedRecipesViewModel: ObservableObject {

   // let savedRecipesCD = SavedRecipesDataService()
    @ObservedObject var homeVM = HomeViewModel()
//   @Published var dataService = RecipeDataService()
  // @Published var savedRecipes: [Recipe] = []
    @Published var savedRecipesArrangedByTags: [String: [LikedRecipeModel]] = [MealTags.breakfast.rawValue: [], MealTags.lunch.rawValue: [], MealTags.dinner.rawValue: [], MealTags.desserts.rawValue: [], MealTags.snacks.rawValue: [], "sides And Appetizers": []]
    @Published var savedRecipes: [LikedRecipeModel] = []
    init(){
        self.getSavedRecipes()
      
    }

    func getSavedRecipes() {

//        homeVM.retrieveSavedIDsFromCoreData()
//        print("home saved = \(homeVM.savedRecipeIDs)")
//        dataService.getSavedRecipe(ids: homeVM.savedRecipeIDs) { recipes in
//            print("saved recepies count == \(recipes?.count)")
//            self.savedRecipes = recipes!
//            self.arrangeRecipesByType2()
           // self.homeVM.savedRecipesDataService\
            //let bunny = self.homeVM.savedRecipesDataService.savedRecipes[2].tags?.allObjects as! [Tags]
       
        
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

      //      if let tags = recipe.tags {

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
          //      }
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

               
           }
       }
    

    }

}

extension LikedRecipesView {
    
    var myCookBooksTitle: some View {
        Text("My Cookbooks")
            .font(.largeTitle)
            .fontWeight(.bold)
    }
    
    var myCookBooksHScroll: some View {
        VStack {
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
      //  }
        }

            
           
        
    }
    }
}
struct LikedRecipesView_Previews: PreviewProvider {
    static var previews: some View {
        LikedRecipesView(vm: LikedRecipesViewModel())
            
    }
}
