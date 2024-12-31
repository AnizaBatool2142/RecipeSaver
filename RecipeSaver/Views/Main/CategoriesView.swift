//
//  CategoriesView.swift
//  RecipeSaver
//
//  Created by ANEEZA on 26/11/2024.
//

import SwiftUI

struct CategoriesView: View {
    
    var body: some View {
        
        NavigationView {
            
            ZStack {
                Color.pear
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    List {
                        ForEach(Category.allCases) { category in
                            
                            NavigationLink {
                                CategoryView(category: category)
                            } label: {
                                Text(category.rawValue + "s")
                                
                            }
                            
                        }
                        
                        .listRowBackground(Color.pear)
                        
                    }
                    .listStyle(.plain)
                    .navigationTitle("Categories")
                }
            }
        }
        .navigationViewStyle(.stack)
    }
    
}

#Preview {
    CategoriesView()
}
