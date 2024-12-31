//
//  HomeView.swift
//  RecipeSaver
//
//  Created by ANEEZA on 26/11/2024.
//

import SwiftUI

struct HomeView: View {
    @State var recipeModels: [RecipeDataModel] = []
    @FetchRequest(sortDescriptors: [
        NSSortDescriptor(key: "datePublished", ascending: false)
    ],
                  animation: .default
    )
   private var recipes: FetchedResults<RecipeData>

    var body: some View {
        
        NavigationView {
            
            ZStack {
                Color.pear
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    ScrollView {
                        RecipeList(recipes: recipeModels, isComingFromFavourite: false)
                    }
                    .background(Color.pear)
                    .navigationTitle("My Recipes")
                   
                }
                .onAppear(){
                    formateRecipes()
                }
                
            }
        }
        .navigationViewStyle(.stack)
        .tint(.white)
    }
    
}
extension  HomeView {
    func formateRecipes ( ) -> Void {
        guard  recipes.count > 0 else { return }
        recipeModels = RecipeFormatter.formattedRecipes(from: recipes)
    }
    
}

#Preview {
    HomeView()

}
