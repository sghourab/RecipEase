//
//  LikedRecipeView.swift
//  Recipes
//
//  Created by Summer Crow on 2022-07-07.
//

import SwiftUI
import Combine


struct LikedRecipesView: View {
    
    @ObservedObject var vm: LikedRecipesViewModel
    @EnvironmentObject private var homeVM: HomeViewModel
    @State private var selectedRecipe: Recipe? = nil
    @State private var showDetailedView: Bool = false

    private let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    private let spacing: CGFloat = 15
    
    var body: some View {
       ScrollView{
           VStack(alignment: .leading, spacing: 5) {
               
               myCookBooksTitle
               
               myCookBooksHScroll
               
               myLikedRecipesView
               
               myLikedRecipesGridView
                   .background(
                       NavigationLink(
                           isActive: $showDetailedView,
                           destination: {
                               DetailedRecipeLoadingView(recipe: $selectedRecipe)
                           },
                           label: { EmptyView() })
                   )
                   

               
           }
       }
    

    }

}

extension LikedRecipesView {
    
    var myCookBooksTitle: some View {
        Text("My Cookbooks")
            .font(.largeTitle)
            .fontWeight(.bold)
            .foregroundColor(Color.theme.accent)
    }
    
    var myCookBooksHScroll: some View {
        VStack {
        ScrollView(.horizontal, showsIndicators: false) {
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
        }
        
    }
    }
    
    var myLikedRecipesView: some View {
        Text("My Liked Recipes")
            .font(.largeTitle)
            .fontWeight(.bold)
            .foregroundColor(Color.theme.accent)
            .padding(.top, 40)
    }
    
    var myLikedRecipesGridView: some View {
       
            LazyVGrid(
                columns: columns,
                alignment: .center,
                spacing: spacing,
                pinnedViews: []) {
                    
                        
                    ForEach(vm.savedRecipes) { recipe in
                            Button {
                                segue(recipe: recipe)
                             
                            } label: {
                                
                                VStack {
                                    ZStack{
                                        Image(uiImage: recipe.image)
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 180, height: 180)
                                            .clipped()
                                            .overlay(Color.black.opacity(0.2))
                                        

                                    }
                                    
                                    Text(recipe.name)
                                        .font(.headline)
                                        .foregroundColor(.primary)
                                
                                    
                                
                            }
                    }
                        }
        
            
                }
    }
    
    private func segue(recipe: LikedRecipeModel) {
        homeVM.dataService.getSavedRecipe(id: recipe.id, completion: { recipe in
            selectedRecipe = recipe
            self.showDetailedView.toggle()
        })
       
    }
}
struct LikedRecipesView_Previews: PreviewProvider {
    static var previews: some View {
        LikedRecipesView(vm: LikedRecipesViewModel())
            
    }
}
