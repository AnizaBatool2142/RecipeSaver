//
//  RecipeSaverDataManager.swift
//  RecipeSaver
//
//  Created by ANEEZA on 26/12/2024.
//

import SwiftUI
import CoreData

class RecipeSaverDataManager {
    
    static let  shared = RecipeSaverDataManager()
    let viewContext: NSManagedObjectContext
    
    init() {
        viewContext =  PersistenceController.shared.container.viewContext
    }
    func saveNewRecipe(recipeDataModelObject: RecipeDataModel) -> Void {
        
        // create a new recipedata managedobject
        let recipeDataEntity = RecipeData(context: viewContext)
        recipeDataEntity.recipeName = recipeDataModelObject.recipeName
        recipeDataEntity.recipeDescription = recipeDataModelObject.recipeDescription
        recipeDataEntity.ingredients = recipeDataModelObject.ingredients
        recipeDataEntity.directions = recipeDataModelObject.directions
        recipeDataEntity.category = recipeDataModelObject.category
        recipeDataEntity.datePublished = recipeDataModelObject.datePublished
        recipeDataEntity.imageURL = recipeDataModelObject.imageURL
        
        try? viewContext.save()
        print("Recipe saved Successfully. With ID: \(recipeDataModelObject.id) ")
        
    }
    func updateRecipe(
        recipeName: String ,
        recipeDescription: String ,
        ingredients:String ,
        directions: String  ,
        isFavourite: Bool ,
        id: UUID ,
        datePublished: String
    ){
        let fetchRequest =
        NSFetchRequest<NSManagedObject>(entityName: "RecipeData")
        fetchRequest.returnsObjectsAsFaults = false
        fetchRequest.predicate = NSPredicate(format:"recipeName == %@", recipeName)
        let result = try? viewContext.fetch(fetchRequest)
        
        if result?.count == 1 {
            let record = result![0]
            record.setValue(recipeName, forKey: "recipeName")
            record.setValue(recipeDescription, forKey: "recipeDescription")
            record.setValue(ingredients, forKey: "ingredients")
            record.setValue(directions, forKey: "directions")
            record.setValue(isFavourite, forKey: "isFavourite")
            record.setValue(id, forKey: "id")
            record.setValue(datePublished, forKey: "datePublished")
            do {
                try viewContext.save()
                print("saved!")
            } catch {
                print(error.localizedDescription)
            }
        }
        
    }
    func deleteRecipe(name: String) {
        do {
            let fetchRequest = RecipeData.fetchRequest()
            fetchRequest.predicate = NSPredicate (format: "recipeName == %@", name)
            if let  recipeToDelete = try viewContext.fetch(fetchRequest).first {
                viewContext.delete(recipeToDelete)
                try viewContext.save()
            }
        } catch {
            print("Error deleting recipe: \(error.localizedDescription)")
        }
        
    }
    //    func deleteAll() {
    //          let fetchRequest1: NSFetchRequest<NSFetchRequestResult> = RecipeData.fetchRequest()
    //          let batchDeleteRequest1 = NSBatchDeleteRequest(fetchRequest: fetchRequest1)
    //          _ = try? viewContext.execute(batchDeleteRequest1)
    //    }
    //
    
}
