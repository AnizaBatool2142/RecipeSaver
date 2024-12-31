//
//  FavouritesView.swift
//  RecipeSaver
//
//  Created by ANEEZA on 26/11/2024.
//

import SwiftUI

struct FavouritesView: View {
    @State   var recipeModels:[RecipeDataModel] = []
    @FetchRequest(sortDescriptors: [
        NSSortDescriptor(key: "datePublished", ascending: false) ],
                  predicate: NSPredicate(format: "isFavourite == %@", NSNumber(value: true)) ,
                  animation: .default
    )
   private var recipes: FetchedResults<RecipeData>
    
    var body: some View {
        
        NavigationView {
            ZStack {
                Color.darkOrange
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    ScrollView {
                        RecipeList(recipes: recipeModels , isComingFromFavourite: true)
                    }
                    .background(Color.orange)
                    .navigationTitle("My Recipes")
                }
                .onAppear(){
                    formateRecipes()
                }
                
            }    
        }
        .navigationViewStyle(.stack)
    }
}

extension  FavouritesView {
    func formateRecipes ( ) -> Void {
        guard  recipes.count > 0 else { return }
        recipeModels = RecipeFormatter.formattedRecipes(from: recipes)
    }
    
}

#Preview {
    FavouritesView()
}
