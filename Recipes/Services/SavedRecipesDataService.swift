//
//  SavedRecipesDataService.swift
//  Recipes
//
//  Created by Summer Crow on 2022-07-06.
//

import Foundation
import CoreData

class SavedRecipesDataService {
    
    private let container: NSPersistentContainer
    private let containerName: String = "SavedRecipesContainer"
    private let entityName: String = "SavedRecipes"
    private let tagEntityName: String = "Tags"
    
    @Published var savedRecipes: [SavedRecipes] = []
    @Published var savedRecipeTags: [Tags] = []
    
    
    init() {
        container = NSPersistentContainer(name: containerName)
        container.loadPersistentStores { [self] _, error in
            if let error = error {
                print("Error loading Core Data! \(error)")
            }
            
            self.getSavedRecipes()
            self.getSavedRecipeTags()
            
            
        }
        
        
    }
    
    func updateSavedRecipes(recipe: Recipe, imageData: Data) {
        //check if recipe is already saved:
        
        if let entity = savedRecipes.first(where: { $0.recipeID == Int16(recipe.id)
        }) {
            delete(entity: entity)
        } else {
            add(recipe: recipe, imageData: imageData)
        }
    }
    
    private func getSavedRecipes() {
        
        let request = NSFetchRequest<SavedRecipes>(entityName: entityName)
        do {
            savedRecipes =  try container.viewContext.fetch(request)
        } catch {
            print("Error fetching saved recipes. \(error)")
        }
    }
    
    private func getSavedRecipeTags() {
        let request = NSFetchRequest<Tags>(entityName: tagEntityName)
        do {
            savedRecipeTags =  try container.viewContext.fetch(request)
        } catch {
            print("Error fetching saved recipes. \(error)")
        }
    }
    
    private func add(recipe: Recipe, imageData: Data) {
        let entity = SavedRecipes(context: container.viewContext)
            entity.recipeID = Int16(recipe.id)
            entity.recipeName = recipe.name
            entity.image = imageData
        if let tags = recipe.tags {
            add(tags: tags, To: entity)
        }
        applyChanges()
    }
    
    private func add(tags: [Tag], To recipe: SavedRecipes) {
        let newTag = Tags(context: container.viewContext)
        
        
            for tag in tags {
            if tag.name?.lowercased() == MealTags.breakfast.rawValue || tag.name?.lowercased() == MealTags.lunch.rawValue || tag.name?.lowercased() == MealTags.dinner.rawValue || tag.name?.lowercased() == MealTags.appetizers.rawValue || tag.name?.lowercased() == MealTags.sides.rawValue || tag.name?.lowercased() == MealTags.snacks.rawValue || tag.name?.lowercased() == MealTags.desserts.rawValue {
                newTag.name = tag.name
            
        }
        }
        newTag.recipes = recipe
    }

    
    private func delete(entity: SavedRecipes) {
        container.viewContext.delete(entity)
        applyChanges()
    }
    
    private func save() {
        
        do {
            try container.viewContext.save()
        } catch let error {
            print("Error saving to Core Data. \(error)")
        }
    }
    
    private func applyChanges() {
        save()
        getSavedRecipes()
        getSavedRecipeTags()
    }
}
