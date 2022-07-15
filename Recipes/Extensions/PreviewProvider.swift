//
//  PreviewProvider.swift
//  Recipes
//
//  Created by Summer Crow on 2022-06-03.
//

import Foundation
import SwiftUI

extension PreviewProvider {
    static var dev: DeveloperPreview {
        return DeveloperPreview.instance
    }
}

class DeveloperPreview {
    
    static let instance = DeveloperPreview()
    private init() { }
    
    let homeVM = HomeViewModel()
    
    let recipe = Recipe(
        id: 71634,
        name: "Kazakhh Beef Plov",
        aspectRatio: "16:9",
        country: "US",
        nutrition: Nutrition(calories: 576, sugar: 7, carbohydrates: 68, fiber: 3, updatedAt: nil, protein: 23, fat: 22),
        numServings: 6,
        tipsAndRatingsEnabled: true,
        instructions: [Instruction(startTime: 5, appliance: "pot", endTime: 10, temperature: 125, id: 111, position: 1, displayText: "Add garlic garlic hello garlic hello garlic hello garlic Add spices to fish Add spices to fish Add spices to fish Add spices to fish Add spices"), Instruction(startTime: 5, appliance: "pot", endTime: 10, temperature: 125, id: 111, position: 2, displayText: "Add onions"), Instruction(startTime: 5, appliance: "pot", endTime: 10, temperature: 125, id: 111, position: 3, displayText: "Add potatoes"), Instruction(startTime: 5, appliance: "pot", endTime: 10, temperature: 125, id: 111, position: 4, displayText: "mix together"), Instruction(startTime: 5, appliance: "pot", endTime: 10, temperature: 125, id: 111, position: 5, displayText: "Add spices to fish"),Instruction(startTime: 5, appliance: "pot", endTime: 10, temperature: 125, id: 111, position: 1, displayText: "Add garlic"), Instruction(startTime: 5, appliance: "pot", endTime: 10, temperature: 125, id: 111, position: 2, displayText: "Add onions"), Instruction(startTime: 5, appliance: "pot", endTime: 10, temperature: 125, id: 111, position: 3, displayText: "Add potatoes"), Instruction(startTime: 5, appliance: "pot", endTime: 10, temperature: 125, id: 111, position: 4, displayText: "mix together"), Instruction(startTime: 5, appliance: "pot", endTime: 10, temperature: 125, id: 111, position: 5, displayText: "Add spices to fish Add spices to fish Add spices to fish Add spices to fish Add spices to fish Add spices to fish"),Instruction(startTime: 5, appliance: "pot", endTime: 10, temperature: 125, id: 111, position: 1, displayText: "Add garlic"), Instruction(startTime: 5, appliance: "pot", endTime: 10, temperature: 125, id: 111, position: 2, displayText: "Add onions"), Instruction(startTime: 5, appliance: "pot", endTime: 10, temperature: 125, id: 111, position: 3, displayText: "Add potatoes"), Instruction(startTime: 5, appliance: "pot", endTime: 10, temperature: 125, id: 111, position: 4, displayText: "mix together"), Instruction(startTime: 5, appliance: "pot", endTime: 10, temperature: 125, id: 111, position: 5, displayText: "Add spices to fish")],
        keywords: "",
        showID: 17,
        updatedAt: 1654015457,
        draftStatus: "published",
        thumbnailURL: "https://img.buzzfeed.com/tasty-app-user-assets-prod-us-east-1/recipes/87381c5f66b146c7ba489664ee95a7ee.jpeg",
        totalTimeMinutes: 25,
        seoTitle: "",
        sections: [],
        tags: [],
        show: nil,
        credits: [],
        nutritionVisibility: "auto",
        prepTimeMinutes: 10,
        brandID: nil,
        description: "This is a very yummy meal",
        cookTimeMinutes: 15,
        userRatings: nil,
        inspiredByURL: "",
        servingsNounPlural: "servings",
        servingsNounSingular: "serving",
        canonicalID: "recipe:8240",
        promotion: "full",
        slug: "kazakhh-beef-plov",
        approvedAt: 1654015456,
        isOneTop: false,
        yields: "Servings: 6-10",
        language: "eng",
        createdAt: 1652826208,
        thumbnailAltText: "",
        isShoppable: true)
}
