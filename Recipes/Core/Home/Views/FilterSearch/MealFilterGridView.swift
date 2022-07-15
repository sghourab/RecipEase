//
//  MealFilterGridView.swift
//  Recipes
//
//  Created by Summer Crow on 2022-06-28.
//

import SwiftUI

struct MealFilterGridView: View {
    
    var filterOptions: [MealPreferences]
    var index: Int
    
    var body: some View {
        RoundedRectangle(cornerRadius: 15)
            .fill(filterOptions[index].include ? Color.theme.accent : Color.theme.background)
        .frame(height: 50)
        .shadow(color: Color.theme.accent.opacity(0.8), radius: 9)
        .padding()
        .overlay(
            Text((filterOptions[index].mealTag))
                .bold()
                .foregroundColor(filterOptions[index].include ? Color.theme.secondaryText : Color.theme.accent)
        )
    }
}

struct MealFilterGridView_Previews: PreviewProvider {
    static var previews: some View {
        MealFilterGridView(filterOptions: [MealPreferences(mealTag: "Low-carb", include: false), MealPreferences(mealTag: "Keto", include: false), MealPreferences(mealTag: "Vegetarian", include: false), MealPreferences(mealTag: "Pescatarian", include: false), MealPreferences(mealTag: "Vegan", include: false)], index: 4)
    }
}
