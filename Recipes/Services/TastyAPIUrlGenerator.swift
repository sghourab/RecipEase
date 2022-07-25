//
//  TastyAPIUrlGenerator.swift
//  Recipes
//
//  Created by Summer Crow on 2022-06-28.
//

import Foundation


class TastyApiUrlGenerator{
    //    base url: "https://tasty.p.rapidapi.com/recipes/list?from=0&size=30"
    //    + tags: &tags=(insertTag1)%20(insertTag2)$20(insertTag3)
    //    +q: &q=(insertIngredient1)$20(insertIngredient2)
    
    static let instance = TastyApiUrlGenerator()
    
    init() {}

    func urlGenerator(numberOfReturnedRecipes: String? = "50", mealTags: String?) -> String{

        var components = URLComponents()
        components.scheme = "https"
        components.host = "tasty.p.rapidapi.com"
        components.path = "/recipes/list"

        components.queryItems = [
            URLQueryItem(name: "from", value: "0"),
            URLQueryItem(name: "size", value: numberOfReturnedRecipes),
            URLQueryItem(name: "tags", value: mealTags),
           
        ]
        return(components.string!)
        
        
    }
}
