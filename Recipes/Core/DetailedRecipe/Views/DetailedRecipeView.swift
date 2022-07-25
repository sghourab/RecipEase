//
//  DetailedRecipe.swift
//  Recipes
//
//  Created by Summer Crow on 2022-06-26.
//

import SwiftUI

struct DetailedRecipeLoadingView: View {
    
    @Binding var recipe: Recipe?
    
    
    var body: some View {
        ZStack{
            if let recipe = recipe {
                DetailedRecipe(recipe: recipe)
            }
        }
    }
}

struct DetailedRecipe: View {
    
    @EnvironmentObject private var vm: HomeViewModel
    var recipe: Recipe
    @State var likedTapped: Bool = false
   // @State var savedRecipeIDs: [Int] = []
    @State private var showInstructions: Bool = false
   // let savedRecipesCD = SavedRecipesDataService()
    @StateObject var detailedRecipeVM: DetailedRecipeViewModel
    
    init(recipe: Recipe) {
        self.recipe = recipe
        
        _detailedRecipeVM = StateObject(wrappedValue: DetailedRecipeViewModel(recipe: recipe))
        
    }
    
    var body: some View {
        ZStack {
            //background layer
            Color.theme.background
                .ignoresSafeArea()
            
        ScrollView(){
            VStack(alignment: .leading, spacing: 0) {
                RecipeImageView(recipe: recipe)
                    .scaledToFit()
                recipeTitleView
                    .padding(.horizontal)
                
                if recipe.numServings != nil && recipe.totalTimeMinutes != nil {
                cookTimeAndServingNumView
                .padding(.horizontal)
                }
               
                
            }
            VStack(alignment: .leading){
                HStack(alignment: .center, spacing: 0) {
               
                    showIngredientsButton
                   
                    showInstructionsButton
 
                }
                if showInstructions {
                    instructionsList
                } else {
                    ingredientsList
                }
               
            }
      
        }
            
        }.onAppear {
            let savedRecipesInCD = vm.savedRecipesDataService.savedRecipes
            for savedRecipe in savedRecipesInCD {
                if recipe.id == savedRecipe.recipeID {
                    likedTapped = true
            }
            }
//            if vm.savedRecipeIDs.contains(recipe.id) {
//                print("it does")
//                likedTapped = true
//            }
        }
    }
  
}

struct DetailedRecipe_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DetailedRecipe(recipe: dev.recipe)
                .navigationBarHidden(true)
        }
        .preferredColorScheme(.dark)
       
    }
}

extension DetailedRecipe {
    
   
    
   private var recipeTitleView: some View {
        
        HStack{
        Text(recipe.name)
            .font(.title)
            .bold()
        Spacer()
            Button {
                likedTapped.toggle()
                vm.updateSavedRecipes(recipe: recipe, imageData: detailedRecipeVM.imageData!)
            } label: {
                Image(systemName: likedTapped == true ? "heart.fill" : "heart")
                    .font(.title)
                    .foregroundColor(Color.red)
                    
            }

      
        }
    }
    
   private var cookTimeAndServingNumView: some View {
       HStack(spacing: 2) {
            Text(recipe.prepTimeInMinsString)
            Text(recipe.cookTimeInMinsString != "" ? "|" : "")
            Text(recipe.cookTimeInMinsString)
            Spacer()
            Button {
                
            } label: {
                Text(recipe.numServings != nil ? "\(recipe.numServings ?? 0) servings" : "")
                    
//                Image(systemName: "chevron.down")
//                    .offset(y: 3)
//                    .padding(.leading, 0)
            }
   
       }.foregroundColor(Color.theme.secondaryText)
    }
    
    private var showIngredientsButton: some View {
        Button {
            showInstructions = false
        } label: {
            Text("Ingredients")
                .fontWeight(.bold)
                .foregroundColor(showInstructions == true ? Color.theme.accent : Color.primary)
                .padding(.top)
                .padding(.bottom)
                .padding(.leading)
        }.frame(maxWidth: .infinity, alignment: .leading)
        .background(showInstructions == true ? Color.theme.background : Color.theme.accent)
        .cornerRadius(10, corners: [.topLeft, .topRight])
    }
        
    private var showInstructionsButton: some View {
        Button {
            showInstructions = true
        } label: {
            Text("Instructions")
                .fontWeight(.bold)
                .foregroundColor(showInstructions ? Color.primary : Color.theme.accent)
                .padding(.top)
                .padding(.bottom)
                .padding(.leading)
        }.frame(maxWidth: .infinity, alignment: .leading)
            .background(showInstructions ? Color.theme.accent : Color.theme.background)
        .cornerRadius(10, corners: [.topLeft, .topRight])
    }
    
    private var instructionsList: some View {
        List {
            if let instructions = recipe.instructions {
               
                ForEach(instructions, id: \.position) { instruction in
                    HStack{
                        Text("\(instruction.position!)")
                            .foregroundColor(Color.theme.secondaryText)
                            .frame(width: 20)
          
                    Text(instruction.displayText!)
                            .lineLimit(nil)
                            .fixedSize(horizontal: false, vertical: true)
                         
                    }.listRowInsets(.init(top: 10, leading: 5, bottom: 10, trailing: 0))
            }
            }
            
        }.listStyle(PlainListStyle())
        .frame(maxWidth: .infinity)
        .frame(height: 500)
            .background(Color.theme.background)
    }
    
    private var ingredientsList: some View {
        List {
            if let sections = recipe.sections {
               // if sections.count > 1 {
                ForEach(sections, id: \.position) { section in
                  
                    if sections.count > 1 {
                        HStack{
                            if section.name != nil {
                            Text("\(section.name!)")
                                .lineLimit(nil)
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.headline)
                                .foregroundColor(Color.theme.accent)
                            }
                        }.listRowInsets(.init(top: 10, leading: 5, bottom: 10, trailing: 0))
                    }
                        ForEach(section.components!, id: \.position) {component in
                        
                        HStack {
                            
                            Text("\(component.rawText ?? "ingredients unavailable")")
                        }
                    }
                }
            }
        }.listStyle(PlainListStyle())
        .frame(maxWidth: .infinity)
        .frame(height: 500)
        .background(Color.theme.background)
    }


    

}
