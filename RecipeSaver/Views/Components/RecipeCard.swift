//
//  RecipeCard.swift
//  RecipeSaver
//
//  Created by ANEEZA on 19/12/2024.
//
import SwiftUI

struct RecipeCard: View {
    
    var recipe: RecipeDataModel
    @State  var isFavourite: Bool
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string:recipe.imageURL)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .overlay(alignment: .bottom) {
                        Text(recipe.recipeName)
                            .font(.headline)
                            .foregroundColor(.white)
                            .shadow(color: .black, radius: 3 , x: 0 , y: 0)
                            .frame(maxWidth: 136)
                            .padding()
                    }
                
            } placeholder: {
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40, alignment: .center)
                    .foregroundColor(.white.opacity(0.7))
                    .frame(maxWidth: .infinity , maxHeight: .infinity)
                    .overlay(alignment: .bottom) {
                        Text(recipe.recipeName)
                            .font(.headline)
                            .foregroundColor(.white)
                            .shadow(color: .black, radius: 3 , x: 0 , y: 0)
                            .frame(maxWidth: 136)
                            .padding()
                    }
            }
            Button(action: {
                isFavourite.toggle()
                update()
            }) {
                Image(systemName: isFavourite ? "heart.fill" : "heart")
                    .foregroundColor(isFavourite ? .darkOrange : .white)
                    .padding() 
            }
        }
        
        .frame(width: 160, height: 217, alignment: .top)
        .background(
            LinearGradient(
                gradient: Gradient(
                    colors: [Color.gray.opacity(0.3), Color.gray]
                ),
                startPoint: .top,
                endPoint: .bottom
            )
        )
        .clipShape(
            RoundedRectangle(cornerRadius: 20, style: .continuous)
        )
        .shadow(color: Color.black.opacity(0.3), radius: 15, x: 0, y: 10)
        
    }
}
extension RecipeCard {
    func update ()
    {
        RecipeSaverDataManager.shared.updateRecipe(recipeName: recipe.recipeName, recipeDescription: recipe.recipeDescription, ingredients: recipe.ingredients, directions: recipe.directions, isFavourite: isFavourite, id: recipe.id, datePublished: recipe.datePublished)
        print("record updated")
    }
}
#Preview {
    RecipeCard(recipe: RecipeDataModel.all[0], isFavourite: false)
}
