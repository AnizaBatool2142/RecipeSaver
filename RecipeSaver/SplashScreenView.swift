//
//  SplashScreenView.swift
//  RecipeSaver
//
//  Created by ANEEZA on 18/12/2024.
//

import SwiftUI

struct SplashScreenView: View {
    @State private var showAnimation1:Bool = false
    @State private var showAnimation2:Bool = false
    @State private var showAnimation3:Bool = false
   
    var body: some View {
        
        ZStack {
            Color.pear
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Image("magic")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .opacity(showAnimation2 ? 1 : 0)
                Text("Recipe Box")
                    .font(.system(size: 30))
                    .foregroundColor(.black)
                    .opacity(showAnimation1 ? 1 : 0)
                Text("Easily add, categorize, and access your \npersonal recipe collection.")
                    .font(.system(size: 18))
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                    .opacity(showAnimation3 ? 1 : 0)
            }
            .onAppear(perform: {
                withAnimation(.smooth(duration: 1))
                {
                    showAnimation1.toggle()
                }
                withAnimation(.smooth(duration: 1.5).delay(1))
                {
                    showAnimation2.toggle()
                }
                withAnimation(.smooth(duration: 2.0).delay(2))
                {
                    showAnimation3.toggle()
                }

            })
        }
    }
}

#Preview {
    SplashScreenView()
}
