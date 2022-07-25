//
//  SwiftUIView.swift
//  Recipes
//
//  Created by Summer Crow on 2022-07-11.
//

import SwiftUI


struct CookBookView: View {
    
    let recipe: LikedRecipeModel?
    var mealType: String
    var mealTypeCount: String
    var body: some View {
        ZStack {
            if let recipe = recipe {
                Image(uiImage: recipe.image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 200, height: 200)
                    .clipped()
                    
                    
                
            } else {
                Image("cookbook2")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 200, height: 200)
                    .clipped()
            }
                
           
        }.frame(width: 200, height: 200)
            
        .overlay(alignment: .center) {
            ZStack {
                Color.black.opacity(0.2)
                VStack{
                    Text(mealType)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                    Text(mealTypeCount == "1" ? "\(mealTypeCount) recipe" : "\(mealTypeCount) recipes")
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(Color.theme.accent)
                }
                
                
            }
            
        }
    }
}

//struct CookBookView_Previews: PreviewProvider {
//    static var previews: some View {
//        CookBookView(recipe: dev.recipe, mealType: "Breakfast", mealTypeCount: "1")
//            .preferredColorScheme(.dark)
//    }
//}
