//
//  RecipeFormatter.swift
//  RecipeSaver
//
//  Created by ANEEZA on 27/12/2024.
//

import Foundation
import SwiftUI

class RecipeFormatter {
    
    static func formattedRecipes(from items: FetchedResults<RecipeData>) -> [RecipeDataModel] {
        let recipeModel =  items.map{ i in
            
            RecipeDataModel (ingredients: i.ingredients!, recipeDescription: i.recipeDescription!, directions: i.directions!, recipeName: i.recipeName!, category: i.category!, datePublished: i.datePublished!, imageURL: i.imageURL!  , isFavourite: i.isFavourite)
        }
        return recipeModel
    }

}
