//
//  FilterRecipesView.swift
//  Recipes
//
//  Created by Summer Crow on 2022-06-15.
//

import SwiftUI


struct FilterRecipesView: View {
    
    
    
    @EnvironmentObject private var vm: HomeViewModel
    @Environment(\.dismiss) var dismiss
    @State var tags: [String] = []
    @State var searchText: String
        
   
    private let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
   
    private let spacing: CGFloat = 15
   
    var body: some View {
        NavigationView{
            ScrollView{
                VStack(alignment: .leading, spacing: 10) {
                    
                    mealTypeHeaderView
                    
                    Divider()
                    
                    mealTypeGridView
                    
                    menuTypeHeaderView
                   
                    Divider()
                    
                    menuTypeGridView
                    
                      
                    Divider()
                    
                  
                }.padding()
            }
            .navigationTitle("Filter RecipEase")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    
                    xMarkButton

                }
            }
        }
    }
}

struct FilterRecipesView_Previews: PreviewProvider {
    static var previews: some View {
        FilterRecipesView(searchText: "")
            .preferredColorScheme(.dark)
    }
}


extension FilterRecipesView {
    
    var xMarkButton: some View {
        Button {
            var mealTagsString: String = ""
            
            for meal in vm.mealType {
                    if meal.include == true {
                        mealTagsString += " \(meal.mealTag.lowercased())"
                    }
                }
               
                    
            for menu in vm.menuType {
                        if menu.include == true {
                            mealTagsString += " \(menu.mealTag.lowercased())"
                        }
                    }
                    
                
            vm.mealTags = mealTagsString
            vm.upDateURL()
            vm.addSubscribers()
            vm.mealTagsSaveToAppStorage()
            vm.loadMealFiltersFromAppStorage()
                
            
            dismiss()
                
        } label: {
            Image(systemName: "xmark")
                .font(.headline)
        }
    }
    
    var mealTypeHeaderView: some View {
        Text("Meal Type")
        .font(.title2)
        .bold()
        .foregroundColor(Color.theme.accent)
        .frame(maxWidth: .infinity, alignment: .leading)
        }
        
    var menuTypeHeaderView: some View {
        Text("Menu Type")
            .font(.title2)
            .bold()
            .foregroundColor(Color.theme.accent)
            .frame(maxWidth: .infinity, alignment: .leading)
    }


    var mealTypeGridView: some View {
        LazyVGrid(
            columns: columns,
            alignment: .center,
            spacing: spacing,
            pinnedViews: []) {
                
               if vm.mealType == [] {
                    
                    ForEach(0..<vm.mealTypeDefaults.count, id: \.self) { index in
                        Button {

                            
                            vm.mealTypeDefaults[index].include.toggle()
                         
                        } label: {
                            MealFilterGridView(filterOptions: vm.mealTypeDefaults, index: index)
                           
                        }

                    }
                }
                else {

                    ForEach(0..<vm.mealType.count, id: \.self) { index in

                        Button {
                            vm.mealType[index].include.toggle()
                     
                        } label: {
                            
                            MealFilterGridView(filterOptions: vm.mealType, index: index)

                        }

                    }
                }
        
            }
    }
    
    var menuTypeGridView: some View {
        LazyVGrid(
            columns: columns,
            alignment: .center,
            spacing: spacing,
            pinnedViews: []) {
                
                if vm.menuType == [] {
                     
                     ForEach(0..<vm.menuTypeDefaults.count, id: \.self) { index in
                         Button {

                             
                             vm.menuTypeDefaults[index].include.toggle()
                             
                          
                         } label: {
                             MealFilterGridView(filterOptions: vm.menuTypeDefaults, index: index)
                            
                             
                         }

                     }
                 }
                 else {

                     ForEach(0..<vm.menuType.count, id: \.self) { index in

                         Button {
                             vm.menuType[index].include.toggle()
                            
                         } label: {
                             
                             MealFilterGridView(filterOptions: vm.menuType, index: index)

                         }

                     }
                 }
            }
    }
    

}



