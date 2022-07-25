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
    //@Published var savedRecipeIDs: [Int] = []
    @Published var showLikedView: Bool = false
    @Published var showHomeView: Bool = false

    init() {
        loadMealFiltersFromAppStorage()
        upDateMealTagsForURL()
        upDateURL()
        addSubscribers()
      
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
            }
            .store(in: &cancellables)
    
            
        
        
            }

    
    
    func updateSavedRecipes(recipe: Recipe, imageData: Data){
        savedRecipesDataService.updateSavedRecipes(recipe: recipe, imageData: imageData)
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


    
enum MealTags: String, CaseIterable {
    case breakfast
    case lunch
    case dinner
    case desserts
    case snacks
    case appetizers
    case sides
    
    
}


