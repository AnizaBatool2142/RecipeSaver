//
//  NewRecipeView.swift
//  RecipeSaver
//
//  Created by ANEEZA on 26/11/2024.
//

import SwiftUI

struct NewRecipeView: View {
    @State private var showAddRecipe = false
 
    var body: some View {
        
        NavigationView {
            ZStack {
                Color.darkOrange
                    .edgesIgnoringSafeArea(.all)
                Button("Add recipe manually") {
                    showAddRecipe = true
                        
                }
                .tint(.black)
                .navigationTitle("New Recipe")
            }
        }
        .navigationViewStyle(.stack)
        .sheet(isPresented: $showAddRecipe) {
            AddRecipeView()
        }
    }
}

#Preview {
    NewRecipeView()
  
}
