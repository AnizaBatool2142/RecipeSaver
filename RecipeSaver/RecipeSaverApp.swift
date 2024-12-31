//
//  RecipeSaverApp.swift
//  RecipeSaver
//
//  Created by ANEEZA on 26/11/2024.
//

import SwiftUI

@main
struct RecipeSaverApp: App {
    
    let persistenceController =  PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
    
}
