//
//  SplashScreenView.swift
//  AAIProject
//
//  Created by Vedant Arora on 04/08/23.
//

import SwiftUI

struct SplashScreenView: View {
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    var body: some View {
        if isActive {
            
            ContentView()
            
        } else{
            VStack{
                
                VStack{
                    Image("AAI-Logo")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 300, height: 200)
                        .font(.system(size: 80))
                        
                    Text("AAI ").background(Color.white)
                        .font(Font.custom("iOS App", size: 26))
                        .foregroundColor(.blue)
                    
                }
                

                .background(.white)
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear {
                    
                    withAnimation(.easeIn(duration: 2.0)){
                        
                        self.size = 0.9
                        self.opacity = 1.0
                    }
                }
            }
            .background(.white)
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
                    withAnimation {
                        self.isActive = true
                    }
                    
                }
            }
        }
        }
        
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
