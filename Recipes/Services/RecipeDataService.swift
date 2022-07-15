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
    
    @Published var allRecipesContainer: RecipeList?
    @Published var allRecipes: [Recipe] = []
    @Published var preFilteredRecipes: [Recipe] = []
    @Published var mealTags: String?
    @Published var urlString: String = TastyApiUrlGenerator.instance.urlGenerator(mealTags: "")
    @Published var savedRecipeUrlString: String = "https://tasty.p.rapidapi.com/recipes/get-more-info?id="
   // @Published var savedRecipes: [Recipe] = []
    let dispatchGroup = DispatchGroup()
    
   
    
    init() {
        print("urlString from recipedataservice: \(urlString)")
       getRecipes()
    }

    func getRecipes() {
        
       // guard let url = URL(string: "https://tasty.p.rapidapi.com/recipes/list?from=0&size=20")//  else { return }
        let headers = [
            "X-RapidAPI-Host": "tasty.p.rapidapi.com",
            "X-RapidAPI-Key": "4c8b969e9dmsh434d8985f483c8bp12e5f0jsn599a35f02a67"
        ]

        let request = NSMutableURLRequest(url: NSURL(string: urlString)! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        print("from dataService get recipes class, urlString: \(urlString)")
        
        recipeSubscription =  NetworkingManager.download(request: request)
            .decode(type: RecipeList.self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (returnedRecipes) in
                self?.allRecipes = returnedRecipes.results.filter{ $0.sections != nil }
                self?.recipeSubscription?.cancel()
                
            })
         
       
    }
    
    func getSavedRecipe(ids: [Int], completion: @escaping([Recipe]?) -> ()) {
       
        var savedRecipes: [Recipe] = []
        let headers = [
            "X-RapidAPI-Host": "tasty.p.rapidapi.com",
            "X-RapidAPI-Key": "4c8b969e9dmsh434d8985f483c8bp12e5f0jsn599a35f02a67"
        ]
        for id in ids {
       //    dispatchGroup.enter()
        let request = NSMutableURLRequest(url: NSURL(string: savedRecipeUrlString + "\(id)")! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
            recipeSubscription =  NetworkingManager.download(request: request)
                .decode(type: Recipe.self, decoder: JSONDecoder())
                .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (returnedRecipe) in

                    print(" RETURNED RECIPE HERE: \(returnedRecipe)")
                    savedRecipes.append(returnedRecipe)
                    completion(savedRecipes)
                    self?.recipeSubscription?.cancel()

            })
            
            
        }
       // dispatchGroup.leave()
        //dispatchGroup.notify(queue: DispatchQueue.main, execute: {
        //   print("All Done")
       // })
    }
    
//    func getAllSavedRecipes(ids: [Int]) -> [Recipe] {
//        var myRecipes: [Recipe] = []
//        for id in ids {
//            getSavedRecipe(id: id) { recipe in
//                myRecipes.append(recipe!)
//            }
//        }
//        return myRecipes
//    }
        
        
    
}

