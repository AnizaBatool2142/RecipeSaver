//
//  CategoryView.swift
//  RecipeSaver
//
//  Created by ANEEZA on 20/12/2024.
//

import SwiftUI

struct CategoryView: View {
    
    @State   var recipeModels: [RecipeDataModel] = []
    @FetchRequest(sortDescriptors: [
        NSSortDescriptor(key: "datePublished", ascending: false)
    ],
                  animation: .default
    )
   private var recipes: FetchedResults<RecipeData>

    var category: Category
    //computed property
    var filteredRecipes:[RecipeDataModel] {
        return recipeModels.filter{$0.category == category.rawValue }
    }
    var body: some View {
        ScrollView {
            RecipeList(recipes: filteredRecipes , isComingFromFavourite: false)
        }
        .onAppear(){
            formateRecipes()
        }
        .navigationTitle(category.rawValue + "s")
        .background(Color.darkOrange)
    }
}
extension CategoryView {
    
    func formateRecipes ( ) -> Void {
        guard  recipes.count > 0 else { return }
        recipeModels = RecipeFormatter.formattedRecipes(from: recipes)
  }

}

#Preview {
    CategoryView(category: Category.soup)
}
