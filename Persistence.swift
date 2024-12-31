//
//  Persistence.swift
//  RecipeSaver
//
//  Created by ANEEZA on 26/12/2024.
//

import CoreData

struct PersistenceController {
    static let shared  = PersistenceController()
    let container: NSPersistentContainer
    
    init() {
        
        container = NSPersistentContainer(name: "RecipeSaverModel")
        container.loadPersistentStores {  storeDescription, error in
            if let _  = error  as NSError? {
                // perform action for error
            }
        }
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
}
