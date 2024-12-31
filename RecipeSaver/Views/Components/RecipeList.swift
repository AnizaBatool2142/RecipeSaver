//
//  RecipeList.swift
//  RecipeSaver
//
//  Created by ANEEZA on 19/12/2024.
//

import SwiftUI

struct RecipeList: View {
    var recipes: [RecipeDataModel]
    @State var isComingFromFavourite: Bool
    
    var body: some View {
        VStack {
            HStack {
                Text("\(recipes.count) \(recipes.count > 1 ? "recipes" : "recipe")" )
                    .font(.headline)
                    .fontWeight(.medium)
                    .opacity(0.7)
                
                Spacer()
            }
            LazyVGrid(
                columns: [GridItem(.adaptive(minimum: 160) , spacing: 15)],
                spacing: 15
            ) {
                ForEach(recipes) { recipe in
                    NavigationLink(destination: RecipeView(recipe: recipe)) {
                        if isComingFromFavourite {
                            RecipeCardFavourite(recipe: recipe)
                        } else {
                            RecipeCard(recipe: recipe, isFavourite: recipe.isFavourite)
                        }
                    }
                }
                //  .onDelete(perform: delete)
            }
            
            .padding(.top)
        }
        .padding(.horizontal)
    }
}

//extension RecipeList {

//    func delete (at offsets: IndexSet)
//    {
//        for index in offsets {
//            let recipeToDelete = recipes[index]
//            Task {
//                RecipeSaverDataManager.shared.deleteRecipe(name: recipeToDelete.recipeName)
//            }
//        }
//
//    }

//}

#Preview {
    ScrollView{
        RecipeList(recipes: RecipeDataModel.all, isComingFromFavourite: false)
    }
}
