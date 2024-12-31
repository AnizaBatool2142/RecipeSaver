//
//  ContentView.swift
//  RecipeSaver
//
//  Created by ANEEZA on 26/11/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var isActive = true
    var body: some View {
        ZStack {
            if isActive {
                SplashScreenView()
            }
            else {
                TabBar()
            }
        }
        .onAppear(perform: {
            withAnimation(.easeInOut(duration: 1).delay(5)) {
                isActive.toggle()
            }
        })
    }
}

#Preview {
    ContentView()
}
