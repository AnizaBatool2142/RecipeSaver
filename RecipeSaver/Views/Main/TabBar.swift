//
//  TabBar.swift
//  RecipeSaver
//
//  Created by ANEEZA on 26/11/2024.
//

import SwiftUI

struct TabBar: View {  
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor(.white)
    }
    
    var body: some View {
        TabView {
                HomeView()
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }
                
                CategoriesView()
                    .tabItem {
                        Label("Categories", systemImage: "square.fill.text.grid.1x2")
                    }
                
                NewRecipeView()
                    .tabItem {
                        Label("New", systemImage: "plus")
                    }
                
                FavouritesView()
                    .tabItem {
                        Label("Favorites", systemImage: "heart")
                    }
                
//                SettingsView()
//                    .tabItem {
//                        Label("Settings", systemImage: "gear")
//                    }
        }
        .accentColor(.black)
                
    }
}

#Preview {
    TabBar()
       
}
