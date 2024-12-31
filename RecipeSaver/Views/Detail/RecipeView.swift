//
//  RecipeView.swift
//  RecipeSaver
//
//  Created by ANEEZA on 20/12/2024.
//
import SwiftUI

struct RecipeView: View {
    var recipe: RecipeDataModel
    
    var body: some View {
        
        ScrollView {
            VStack() {
                AsyncImage(url: URL(string: recipe.imageURL)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 300)
                        .clipped()
                        }
                          placeholder: {
                        Image(systemName: "photo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100, alignment: .center)
                            .foregroundColor(.white.opacity(0.7))
                    }
                          .background(LinearGradient(gradient: Gradient(colors: [Color.gray.opacity(0.2), Color.gray.opacity(0.2)]), startPoint: .top, endPoint: .bottom))
                
                Text(recipe.recipeName)
                    .font(.largeTitle)
                    .bold()
                    .multilineTextAlignment(.center)
                
                if !recipe.recipeDescription.isEmpty {
                    Text(recipe.recipeDescription)
                        .padding(.horizontal, 10)
                        .padding(.top, 10)
                }
                
                if !recipe.ingredients.isEmpty {
                    VStack() {
                        Text("Ingredients")
                            .font(.headline)
                            .padding(.horizontal , 20)
                            .padding(.top , 10)
                        Text(recipe.ingredients)
                            .padding(.horizontal, 10)
                            .padding(.top , 5)
                    }
                }
                
                if !recipe.directions.isEmpty {
                    VStack() {
                        Text("Directions")
                            .font(.headline)
                            .padding(.horizontal, 20)
                            .padding(.top, 10)
                        Text(recipe.directions)
                            .padding(.horizontal, 10)
                            .padding(.top , 5)
                    }
                }
            }
        }
        .ignoresSafeArea(.container, edges: .top)
    }
}

#Preview {
    RecipeView(recipe: RecipeDataModel.all[0])
}
