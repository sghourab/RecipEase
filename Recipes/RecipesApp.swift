//
//  RecipesApp.swift
//  Recipes
//
//  Created by Summer Crow on 2022-05-30.
//

import SwiftUI


//atribute author of the logo <a href='https://www.freepik.com/vectors/flat-logo'>Flat logo vector created by freepik - www.freepik.com</a>
@main
struct RecipesApp: App {
    
    @StateObject private var vm = HomeViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                //DetailedRecipeLoadingView()
                HomeView()
                    .navigationBarHidden(true)
            }
            .environmentObject(vm)
            
        }
    }
}
