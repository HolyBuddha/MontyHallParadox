//
//  LoadingView.swift
//  MontyHallParadox
//
//  Created by Vladimir Izmaylov on 18.01.2022.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        GeometryReader { geometry in
            let sideLength = geometry.size.width / 2
            let sideHeight = geometry.size.height / 4
            ZStack {
                LinearGradient(
                    gradient: Gradient(colors: [.red, .blue, .red]),
                    startPoint: .topTrailing,
                    endPoint: .bottomLeading
                )
                    .ignoresSafeArea()
                    .opacity(0.8)
                VStack(alignment: .center, spacing: 70) {
                    Text("Monty Hall Paradox")
                        .font(.system(size: 40))
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .lineLimit(2)
                    ZStack {
                        Rectangle()
                            .foregroundColor(.white)
                            .frame(width: sideLength, height: sideHeight, alignment: .center)
                            .opacity(0.9)
                            .rotationEffect(.degrees(45))
                            .shadow(radius: 10)
                        Rectangle()
                            .foregroundColor(.purple)
                            .frame(width: sideLength/1.1, height: sideHeight/1.1, alignment: .center)
                            .rotationEffect(.degrees(45))
                            .opacity(0.6)
                        Image("goat")
                            .resizable()
                            .scaledToFit()
                            .aspectRatio(2, contentMode: .fit)
                    }
                    Text("by Vladimir Izmaylov")
                        .font(.subheadline)
                }
                .padding(.bottom, 50)
                .padding(.all, 25)
                .foregroundColor(.white)
                .shadow(radius: 30)
            }
            
        }
        
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
