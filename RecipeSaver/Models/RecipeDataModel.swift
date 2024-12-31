//
//  RecipeDataModel.swift
//  RecipeSaver
//
//  Created by ANEEZA on 26/12/2024.
//

import Foundation

enum Category: String, CaseIterable , Identifiable {
    
    var id:String { self.rawValue }
    case breakfast = "Breakfast"
    case soup = "Soup"
    case salad = "Salad"
    case appetizer = "Appetizer"
    case main = "Main"
    case side = "Side"
    case dessert = "Dessert"
    case wrap = "Wrap"
    case drink = "Drink"
}

struct RecipeDataModel: Identifiable {
    var id =  UUID()
    var ingredients: String
    var  recipeDescription:String
    var directions:String
    var recipeName:String
    var category:String
    var datePublished:String
    var imageURL:String
    var isFavourite:Bool
    
    init(
        ingredients: String = "" ,
         recipeDescription: String  = "",
         directions: String = "",
         recipeName: String = "",
         category: String = "",
         datePublished: String = "",
         imageURL: String = "",
         isFavourite: Bool
    ) {
        self.ingredients = ingredients
        self.recipeDescription = recipeDescription
        self.directions = directions
        self.recipeName = recipeName
        self.category = category
        self.datePublished = datePublished
        self.imageURL = imageURL
        self.isFavourite = isFavourite
    }
    init(recipeDataModel: RecipeData) {
        self.ingredients = recipeDataModel.ingredients ?? ""
        self.recipeDescription = recipeDataModel.recipeDescription ?? ""
        self.directions = recipeDataModel.directions ?? ""
        self.recipeName = recipeDataModel.recipeName ?? ""
        self.category = recipeDataModel.category ?? ""
        self.datePublished = recipeDataModel.datePublished ?? ""
        self.imageURL = recipeDataModel.imageURL ?? ""
        self.isFavourite = recipeDataModel.isFavourite
        
    }
}
extension RecipeDataModel {
    static let all: [RecipeDataModel] = []
    static  var  recipe = RecipeDataModel(isFavourite: false)
}
