//
//  MealPreferencesTags.swift
//  Recipes
//
//  Created by Summer Crow on 2022-06-27.
//

import Foundation

struct MealPreferences: Codable, Equatable {
    let mealTag: String
    var include: Bool
}
