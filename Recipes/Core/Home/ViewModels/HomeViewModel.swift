//
//  HomeViewModel.swift
//  Recipes
//
//  Created by Summer Crow on 2022-06-06.
//

import Foundation
import Combine
import SwiftUI
import CoreData

class HomeViewModel: ObservableObject {
    
    @Published var allRecipes: [Recipe] = []
    @Published var personalRecipes: [Recipe] = []
    
    @Published var searchText: String = ""
  //  @Published var savedRecipes: [Recipe] = []
    
    @Published var dataService = RecipeDataService()
    let savedRecipesDataService = SavedRecipesDataService()
    
    @Published  var mealTypeDefaults: [MealPreferences] = [MealPreferences(mealTag: "Breakfast", include: false), MealPreferences(mealTag: "Lunch", include: false), MealPreferences(mealTag: "Dinner", include: false), MealPreferences(mealTag: "Sides", include: false), MealPreferences(mealTag: "Appetizers", include: false), MealPreferences(mealTag: "Snacks", include: false), MealPreferences(mealTag: "Desserts", include: false)]
    @Published var mealType: [MealPreferences] = []
    @Published var menuTypeDefaults: [MealPreferences] = [MealPreferences(mealTag: "Low-carb", include: false), MealPreferences(mealTag: "Keto", include: false), MealPreferences(mealTag: "Vegetarian", include: false), MealPreferences(mealTag: "Pescatarian", include: false), MealPreferences(mealTag: "Vegan", include: false)]
    @Published var menuType: [MealPreferences] = []
   
    private var cancellables = Set<AnyCancellable>()
    @Published var urlGenerator = TastyApiUrlGenerator()
    @AppStorage("mealTagsPreferences") var mealTagsPreferences: Data = Data()
    @AppStorage("menuTagsPreferences") var menuTagsPreferences: Data = Data()
    
    @Published var mealTags: String = ""
    @Published var savedRecipesArrangedByTags: [String: [Recipe]] = [MealTags.breakfast.rawValue: [], MealTags.lunch.rawValue: [], MealTags.dinner.rawValue: [], MealTags.desserts.rawValue: [], MealTags.snacks.rawValue: [], "sides And Appetizers": []]
    
    @Published var savedRecipes: [Recipe] = []
    @Published var savedRecipeIDs: [Int] = []
    @Published var showLikedView: Bool = false
    @Published var showHomeView: Bool = false

    init() {
        loadMealFiltersFromAppStorage()
        upDateMealTagsForURL()
        upDateURL()
        addSubscribers()
        retrieveSavedIDsFromCoreData()
    }
    
    func mealTagsSaveToAppStorage(){
        
        // SAVING MEAL TYPES:
        
        if mealType == [] {
        guard let mealPreferencesData = try?
                JSONEncoder().encode(mealTypeDefaults) else { return }
        self.mealTagsPreferences = mealPreferencesData
        } else {
            guard let mealPreferencesData = try?
                    JSONEncoder().encode(mealType) else { return }
            self.mealTagsPreferences = mealPreferencesData
        }
        // SAVING MENU TYPES:
        
        if menuType == [] {
        guard let menuPreferencesData = try?
                JSONEncoder().encode(menuTypeDefaults) else { return }
        self.menuTagsPreferences = menuPreferencesData
        } else {
            guard let menuPreferencesData = try?
                    JSONEncoder().encode(menuType) else { return }
            self.menuTagsPreferences = menuPreferencesData
        }
    }
    
    
    func loadMealFiltersFromAppStorage () {
       
       
        guard let mealTagsettings = try?
        JSONDecoder().decode([MealPreferences].self, from: mealTagsPreferences) else { return }
        mealType = mealTagsettings
        
        guard let menuTagsettings = try?
        JSONDecoder().decode([MealPreferences].self, from: menuTagsPreferences) else { return }
        menuType = menuTagsettings
        
        
        
    }

    func upDateMealTagsForURL() {
    for meal in mealType {
            if meal.include == true {
                mealTags += " \(meal.mealTag.lowercased())"
            }
        }
       
            
        for menu in menuType {
                if menu.include == true {
                    mealTags += " \(menu.mealTag.lowercased())"
                }
            }
            
        
        
}
    func upDateURL() {
     
        dataService.urlString = TastyApiUrlGenerator.instance.urlGenerator(numberOfReturnedRecipes: "50", mealTags: mealTags)
        dataService.getRecipes()
        
       
       
    }
    
    func addSubscribers() {
       
        //Updates all recipes including search text items in search bar
    $searchText
            .combineLatest(dataService.$allRecipes)
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .map(filterRecipes)
            .sink { [weak self] (returnedRecipes) in
                self?.allRecipes = returnedRecipes
                self?.showHomeView = true
                print("all recipes count: \(self?.allRecipes.count)")
                
            }
            .store(in: &cancellables)
    
            
        
        
            }
    
    func retrieveSavedRecipesFromCoreData() {
        dataService.getSavedRecipe(ids: [8246, 8357, 8280], completion: { savedRecipes in
            self.savedRecipes = savedRecipes!
        })
//       dataService.getAllSavedRecipes(ids: [8246, 8357, 8280], completion: { savedRecipes in
//           self.savedRecipes = savedRecipes!
           self.arrangeRecipesByType()
        
      //  })
       // arrangeRecipesByType()
    }
//
//      func retrieveSavedRecipesFromCoreData() {
//
//          //dataService.urlString = TastyApiUrlGenerator.instance.urlGenerator(numberOfReturnedRecipes: "1000", mealTags: "")
//        //  dataService.getRecipes()
//         // for tag in MealTags.allCases {
//        //  dataService.getRecipes()
//       //  dataService.urlString = TastyApiUrlGenerator.instance.urlGenerator(numberOfReturnedRecipes: "100", mealTags: "")
//         // dataService.getRecipes()
//          $allRecipes
//              .combineLatest(savedRecipesDataService.$savedEntities)
//              .map({ allrecipes, savedRecipes -> [Recipe] in
//                  var recipesInCommon: [Recipe] = []
//                  for savedRecipe in savedRecipes {
//
//                      for recipe in allrecipes {
//                              if recipe.id == savedRecipe.recipeID {
//                                  recipesInCommon.append(recipe)
//                              }
//
//                          }
//
//                      }
//                  return recipesInCommon
//
//              })
////          savedRecipesDataService.$savedEntities
////              .combineLatest(dataService.$allRecipes)
////              .map { (savedRecipes, recipes) -> [Recipe] in
////                  savedRecipes
////                      .compactMap { savedRecipe -> Recipe? in
////                          print("SAved Recipe Name\(savedRecipe.recipeID)")
////                                print("SAved Recipe Name\(savedRecipe.name)")
////                          guard let recipe = recipes.first(where: { $0.id == savedRecipe.recipeID
////
////                          }) else {
////                              return nil
////                          }
//////                          if tag.rawValue == "lunch" {
////                              print("lunch name: \(recipe.name), tag IS: \(tag.rawValue)")
////                          }
//                          //print("RECIPE NAME\(recipe.name)")
//                         // print("Recipe tags: \(recipe.tags)")
//                             //   return recipe
//                    //  }
//           //   }
//              .sink { [weak self] (recipesInCommon) in
//               //   self?.isLoading = false
//                  self?.savedRecipes = recipesInCommon
//                  self?.arrangeRecipesByType()
//
////                  print("MealTag IS \(self?.mealTags)")
////                  print("eeeeeek")
//                 // print("her her here here\(self?.savedRecipes)")
//
//
//              }
//              .store(in: &cancellables)
//         // }
//      }
        
//            func mapAllRecipesToSavedRecipes(allRecipes: [Recipe], savedRecipes: [SavedRecipes]) -> [Recipe]{
//                savedRecipes1 =   allRecipes
//                      .filter {
//                         savedRecipes.first(where: { $0.recipeID == recipe.id})
//                      }
//              }
    
    func retrieveSavedIDsFromCoreData() {
        for entity in savedRecipesDataService.savedEntities {
            savedRecipeIDs.append(Int(entity.recipeID))
           
        }
        print("HERE: \(savedRecipeIDs)")
    }
    enum MealTags: String, CaseIterable {
        case breakfast
        case lunch
        case dinner
        case desserts
        case snacks
        case appetizers
        case sides
        
        
    }
    
    func arrangeRecipesByType(){
       // print("called0")
        print("The count")
        print(savedRecipes.count)
    
        savedRecipesArrangedByTags = [MealTags.breakfast.rawValue: [], MealTags.lunch.rawValue: [], MealTags.dinner.rawValue: [], MealTags.desserts.rawValue: [], MealTags.snacks.rawValue: [], "sides And Appetizers": []]
    
        for recipe in savedRecipes {
            
            if let tags = recipe.tags {
             
                for tag in tags {
                
                    
                  
                  //  if !(savedRecipesArrangedByTags[MealTags.breakfast.rawValue]!.contains(where: {$0.id == recipe.id})) {
                        if tag.name?.lowercased() == MealTags.breakfast.rawValue {
                        savedRecipesArrangedByTags[MealTags.breakfast.rawValue]?.append(recipe)
                   //         savedRecipesArrangedByTags[MealTags.breakfast.rawValue]!.uniqued()
                            
                        }
                  //  }

               //     if !(savedRecipesArrangedByTags[MealTags.lunch.rawValue]!.contains(where: {$0.id == recipe.id})) {

                        if tag.name?.lowercased() == MealTags.lunch.rawValue {
                       print(tag.name?.lowercased())
                            savedRecipesArrangedByTags[MealTags.lunch.rawValue]?.append(recipe)
                       // print("The recipe\(recipe)")
                        print("in the arranged array \(savedRecipesArrangedByTags["lunch"])")
                        }
                //    }
                    
                  //  if !(savedRecipesArrangedByTags[MealTags.dinner.rawValue]!.contains(where: {$0.id == recipe.id})) {

                    if tag.name?.lowercased() == MealTags.dinner.rawValue {
                       
                            savedRecipesArrangedByTags[MealTags.dinner.rawValue]?.append(recipe)
                    }
                  //  }
                    
                 //   if !(savedRecipesArrangedByTags[MealTags.desserts.rawValue]!.contains(where: {$0.id == recipe.id})) {
//
                    if tag.name?.lowercased() == MealTags.desserts.rawValue {
                       
                            savedRecipesArrangedByTags[MealTags.desserts.rawValue]?.append(recipe)
                    }
                 //   }
                    
                //    if !(savedRecipesArrangedByTags[MealTags.snacks.rawValue]!.contains(where: {$0.id == recipe.id})) {
                    if tag.name?.lowercased() == MealTags.snacks.rawValue {
                            savedRecipesArrangedByTags[MealTags.snacks.rawValue]?.append(recipe)
                        }
                 //   }
                    
                  //  if !(savedRecipesArrangedByTags["sides And Appetizers"]!.contains(where: {$0.id == recipe.id})) {
                    if tag.name?.lowercased() == MealTags.sides.rawValue || tag.name?.lowercased() == MealTags.appetizers.rawValue {
                       
                            savedRecipesArrangedByTags["sides And Appetizers"]?.append(recipe)
                 //       }
                   
                   }
                   
//                    let sortedSavedRecipeTags = savedRecipesArrangedByTags.sorted {
//                        return $0.value.count > $1.value.count
//                    }
                   // print("MEMEMEMEME: \(sortedSavedRecipeTags)")
//                    if tag.name?.lowercased() == "lunch" {
////                        print("called2")
////                        lunch.append(recipe)
//                    }
//                    if tag.name?.lowercased() == "dinner" {
////                        dinner.append(recipe)
//                    }
//                    if tag.name?.lowercased() == "desserts" {
////                        desserts.append(recipe)
//                    }
//                    if tag.name?.lowercased() == "snacks" {
////                        snacks.append(recipe)
//                    }
//                    if tag.name?.lowercased() == "appetizers" || tag.name?.lowercased() == "sides" {
////                        sidesAndAppetizers.append(recipe)
//                    }
                    
                }
            }
        }
        showLikedView = true
    }
    
    
    func updateSavedRecipes(recipe: Recipe){
        savedRecipesDataService.updateSavedRecipes(recipe: recipe)
    }
    
    func retrieveAllIngredientsInDownloadedRecipes(recipe: Recipe) -> [String]{
      
        var ingredients: [String] = []
            if let sections = recipe.sections {
                for section in sections {
                    if let components = section.components {
                        for component in components {
                            if let ingredient = component.ingredient, let ingredientName = ingredient.name {
                                ingredients.append(ingredientName.lowercased())
                            }
                           
                        }
                    }
                    
                }
            }
        
           return ingredients

    }
    

    
    func filterRecipes(text: String, startingRecipes: [Recipe]) -> [Recipe] {

        guard !text.isEmpty else {
           
                        return startingRecipes
                    }
        let lowerCasedSearchedText = text.lowercased()
        

            return startingRecipes.filter { recipe in
               


            let allIngredients = retrieveAllIngredientsInDownloadedRecipes(recipe: recipe)

                return allIngredients.contains(lowerCasedSearchedText) || recipe.name.lowercased().contains(lowerCasedSearchedText)
            }
            
 
        
    }
    
    func filterRecipesToFindSavedRecipes(savedRecipes: [SavedRecipes], startingRecipes: [Recipe]) -> [Recipe] {

        
        var recipesInCommon: [Recipe] = []
        for savedRecipe in savedRecipes {
            
            for recipe in startingRecipes {
                    if recipe.id == savedRecipe.recipeID {
                        recipesInCommon.append(recipe)
                    }
                    
                }
               
            }
        return recipesInCommon
    }
    
}


    



