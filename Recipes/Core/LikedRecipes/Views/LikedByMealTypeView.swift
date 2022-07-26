//
//  LikedByMealTypeView.swift
//  Recipes
//
//  Created by Summer Crow on 2022-07-12.
//

import SwiftUI

struct LikedByMealTypeView: View {
    
    var title: String? 
    var recipes: [LikedRecipeModel]?
    @ObservedObject var homeVM = HomeViewModel()
    @State private var selectedRecipe: Recipe? = nil
    @State private var showDetailedView: Bool = false
    
    var body: some View {
        VStack(alignment: .leading) {
            
            titleView
            
            likedRecipeListView
                .listStyle(PlainListStyle())
            
    }.background(
        NavigationLink(
            isActive: $showDetailedView,
            destination: {
                DetailedRecipeLoadingView(recipe: $selectedRecipe)
            },
            label: { EmptyView() })
    )
    }
}

struct LikedByMealTypeView_Previews: PreviewProvider {
    static var previews: some View {
        LikedByMealTypeView()
    }
}





extension LikedByMealTypeView {
    
    private func segue(recipe: LikedRecipeModel) {
        homeVM.dataService.getSavedRecipe(id: recipe.id, completion: { recipe in
            selectedRecipe = recipe
            self.showDetailedView.toggle()
        })
       
    }
    
    var titleView: some View {
        VStack {
        if let title = title {
            Text(title.capitalized)
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.leading)
        }
        }
       
    }
    var likedRecipeListView : some View    {
        List {
        if let recipes = recipes {
        ForEach(recipes) { recipe in
            ZStack(alignment: .leading) {
            Image(uiImage: recipe.image)
                .resizable()
                .scaledToFill()
                .frame(width: 400, height: 250)
                .clipped()
                 .frame(maxWidth: .infinity)
                 .frame(height: 250)
                 .overlay(LinearGradient(gradient: Gradient(colors: [.black.opacity(0), .black.opacity(0.7)]), startPoint: .top, endPoint: .bottom))
                
                .onTapGesture {
                    segue(recipe: recipe)
                }
                
                VStack(alignment: .leading){
                    Spacer()
                    Text(recipe.name)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color.theme.secondaryText)
                        
                        .padding(.leading)
                        .padding(.bottom, 0)

                }
        
        }.listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
                .listRowSeparator(.hidden)
        }
    }
    }
    }
}


