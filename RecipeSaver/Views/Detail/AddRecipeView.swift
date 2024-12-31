//
//  AddRecipeView.swift
//  RecipeSaver
//
//  Created by ANEEZA on 22/12/2024.
//
import SwiftUI

struct AddRecipeView: View {
    
    @State   var recipeModels:[RecipeDataModel] = []
    @FetchRequest(sortDescriptors: [
        NSSortDescriptor(key: "datePublished", ascending: false)
    ],
                  animation: .default
    )
   private var recipes: FetchedResults<RecipeData>
    
    @State private var name: String = ""
    @State private var selectedCategory: Category = Category.main
    @State private var description: String = ""
    @State private var ingredients: String = ""
    @State private var directions: String = ""
    @State private var imageURL: String = ""
    @State private var navigateToRecipe = false
    
    @Environment(\.dismiss) var dismiss
    var body: some View {
        
        NavigationStack {
            Form {
                Section(header: Text("Name")) {
                    TextField("Recipe Name", text: $name)
                }
                
                Section(header: Text("Category")) {
                    Picker("Category", selection: $selectedCategory) {
                        ForEach(Category.allCases) { category in
                            Text(category.rawValue)
                                .tag(category)
                        }
                    }
                    .pickerStyle(.menu)
                }
                
                Section(header: Text("Description")) {
                    TextEditor(text: $description)
                }
                
                Section(header: Text("Ingredients")) {
                    TextEditor(text: $ingredients)
                }
                
                Section(header: Text("Directions")) {
                    TextEditor(text: $directions)
                }
                Section(header: Text("Image URL")) {
                    TextEditor(text: $imageURL)
                }
            }
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Label("Cancel", systemImage: "xmark")
                            .labelStyle(.iconOnly)
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        
                        saveRecipe()
                        navigateToRecipe = true
                        clearFields()
                        
                    } label: {
                        Label("Done", systemImage: "checkmark")
                            .labelStyle(.iconOnly)
                    }
                    .disabled(name.isEmpty || selectedCategory.rawValue.isEmpty || ingredients.isEmpty || description.isEmpty || imageURL.isEmpty)
                }
            })
            .navigationTitle("New Recipe")
            .navigationBarTitleDisplayMode(.inline)
            
            .navigationDestination(isPresented: $navigateToRecipe) {
                RecipeView(recipe:  RecipeDataModel.recipe)
                //recipeModels.sorted { $0.datePublished > $1.datePublished }[0]
            }
        }
        .navigationViewStyle(.stack)
    }
    
}
extension AddRecipeView {
    
    func formateRecipes ( ) -> Void {
        guard  recipes.count > 0 else { return }
        recipeModels = RecipeFormatter.formattedRecipes(from: recipes)
  }

}

#Preview {
     AddRecipeView()
  
}
extension AddRecipeView {
    
    private func saveRecipe() {
        let now = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let datePublished = dateFormatter.string(from: now)
        
        let  recipe = RecipeDataModel(
            ingredients: ingredients,
            recipeDescription: description,
            directions:  directions,
            recipeName: name ,
            category: selectedCategory.rawValue,
            datePublished: datePublished,
            imageURL: imageURL, 
            isFavourite: false
            
         )
    
        
        RecipeDataModel.recipe = recipe
        print(RecipeDataModel.recipe.isFavourite)
        
        RecipeSaverDataManager.shared.saveNewRecipe(recipeDataModelObject: RecipeDataModel.recipe)
    }
    
    private func clearFields() {
            name = ""
            selectedCategory = Category.main
            description = ""
            ingredients = ""
            directions = ""
            imageURL = ""
        }

}
