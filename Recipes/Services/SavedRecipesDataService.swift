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
    
    @Published var savedEntities: [SavedRecipes] = []
    
    
    init() {
        container = NSPersistentContainer(name: containerName)
        container.loadPersistentStores { _, error in
            if let error = error {
                print("Error loading Core Data! \(error)")
            }
            self.getSavedRecipes()
           
        }
    }
    
    func updateSavedRecipes(recipe: Recipe) {
        //check if recipe is already saved:
        if let entity = savedEntities.first(where: { $0.recipeID == Int16(recipe.id)
        }) {
            delete(entity: entity)
        } else {
            add(recipe: recipe)
        }
    }
    
    private func getSavedRecipes() {
        let request = NSFetchRequest<SavedRecipes>(entityName: entityName)
        do {
            savedEntities =  try container.viewContext.fetch(request)
        } catch {
            print("Error fetching saved recipes. \(error)")
        }
    }
    
    private func add(recipe: Recipe) {
        let entity = SavedRecipes(context: container.viewContext)
        entity.recipeID = Int16(recipe.id)
        applyChanges()
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
    }
}
