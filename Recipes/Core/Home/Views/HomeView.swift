//
//  HomeView.swift
//  Recipes
//
//  Created by Summer Crow on 2022-05-30.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject private var vm: HomeViewModel
    @State private var showFilterView: Bool = false
    @State private var showLikedRecipesView: Bool = false
    @State private var output: String = ""
    
    @State private var selectedRecipe: Recipe? = nil
    @State private var showDetailedView: Bool = false
    
    var body: some View {
        if vm.showHomeView == false {
            ProgressView()
        } else {
        ZStack {
            //background layer
            Color.theme.background
                .ignoresSafeArea()
            //content layer
            VStack(spacing: 0) {
                homeHeaderView
                    
                
                SearchBarView(placeholder: "search recipe name or ingredient", searchText: $vm.searchText)
            
                allRecipesList
               
                Spacer(minLength: 0)
            }
            .sheet(isPresented: $showFilterView) {
                FilterRecipesView(searchText: "")
                    .environmentObject(vm)
                
            }
            .onChange(of: showFilterView) { newValue in
                
                
                vm.mealTagsSaveToAppStorage()
                vm.loadMealFiltersFromAppStorage()
               
                vm.upDateURL()
                vm.addSubscribers()
                
                
            }
           
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
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
        HomeView()
                .navigationBarHidden(true)
        }
        .environmentObject(dev.homeVM)
        .previewInterfaceOrientation(.portrait)
       // .preferredColorScheme(.dark)
    }
}







extension HomeView {
    
    private var homeHeaderView: some View {
      
//        HStack {
//            NavigationLink {
//
//              //  if vm.showLikedView == true {
//
//                LikedRecipesView(vm: LikedRecipesViewModel())
//                   // .environmentObject(vm)
////                } else {
////                    ProgressView()
////                }
//            } label: {
//                CircleButtonView(iconName: "person.fill")
//            }.simultaneousGesture(TapGesture().onEnded({
//               // vm.retrieveSavedRecipesFromCoreData()
//            }))
        HStack {
        CircleButtonView(iconName: "person.fill")
            .onTapGesture {
                showLikedRecipesView.toggle()
            }
            Spacer()
            Text("Browse RecipEase")
                .font(.headline)
                .fontWeight(.heavy)
                .foregroundColor(Color.theme.accent)
            Spacer()
            CircleButtonView(iconName: "line.3.horizontal.decrease.circle")
                .onTapGesture {
                    showFilterView.toggle()
                }
        }.padding(.bottom, 0)
            .padding(.top, 0)
            .background(
                NavigationLink(isActive: $showLikedRecipesView, destination: {
                    LikedRecipesView(vm: LikedRecipesViewModel())
                }, label: {
                    EmptyView()
                })
            )
           
    }

    private var allRecipesList: some View {
        
        List{
            ForEach(vm.allRecipes) { recipe in
                RecipeRowView(recipe: recipe)
                    .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
                    .onTapGesture {
                        segue(recipe: recipe)
                    }
            
            }
        }
        .listStyle(PlainListStyle())
    }
    
    private func segue(recipe: Recipe) {
        selectedRecipe = recipe
        showDetailedView.toggle()
    }
}
