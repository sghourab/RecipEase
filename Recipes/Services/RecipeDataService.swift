//
//  RecipesDataService.swift
//  Recipes
//
//  Created by Summer Crow on 2022-06-06.
//

import Foundation
import Combine



//    base url: "https://tasty.p.rapidapi.com/recipes/list?from=0&size=30"
//    + tags: &tags=(insertTag1)%20(insertTag2)$20(insertTag3)
//    +q: &q=(insertIngredient1)$20(insertIngredient2)
class RecipeDataService {
    
    var recipeSubscription: AnyCancellable?
    var savedRecipeSubscription: AnyCancellable?
    
    @Published var allRecipesContainer: RecipeList?
    @Published var allRecipes: [Recipe] = []
    @Published var selectedRecipe: Recipe?
    @Published var mealTags: String?
    @Published var urlString: String = TastyApiUrlGenerator.instance.urlGenerator(mealTags: "")
    @Published var savedRecipeUrlString: String = "https://tasty.p.rapidapi.com/recipes/get-more-info?id="
  
    
    init() {
       getRecipes()
    }

    func getRecipes() {
        
       
        let headers = [
            "X-RapidAPI-Host": "tasty.p.rapidapi.com",
            "X-RapidAPI-Key": "4c8b969e9dmsh434d8985f483c8bp12e5f0jsn599a35f02a67"
        ]

        let request = NSMutableURLRequest(url: NSURL(string: urlString)! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        recipeSubscription =  NetworkingManager.download(request: request)
            .decode(type: RecipeList.self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (returnedRecipes) in
                self?.allRecipes = returnedRecipes.results.filter{ $0.sections != nil }
                self?.recipeSubscription?.cancel()
                
            })
         
       
    }
    
//
    func getSavedRecipe(id: Int, completion: @escaping(Recipe?) -> ()) {

            let headers = [
            "X-RapidAPI-Host": "tasty.p.rapidapi.com",
            "X-RapidAPI-Key": "4c8b969e9dmsh434d8985f483c8bp12e5f0jsn599a35f02a67"
        ]
  
                let request = NSMutableURLRequest(url: NSURL(string: self.savedRecipeUrlString + "\(id)".trimmingCharacters(in: .whitespacesAndNewlines))! as URL,
                                                        cachePolicy: .useProtocolCachePolicy,
                                                    timeoutInterval: 500)
                request.httpMethod = "GET"
                request.allHTTPHeaderFields = headers

                    savedRecipeSubscription =  NetworkingManager.download(request: request)
                        .decode(type: Recipe.self, decoder: JSONDecoder())
                        .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (returnedRecipe) in

                            self?.selectedRecipe = returnedRecipe
                            self?.savedRecipeSubscription?.cancel()
                                completion(returnedRecipe)
                  
                    })
     

    }
      
        
    
    
}

