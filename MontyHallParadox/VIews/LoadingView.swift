//
//  LoadingView.swift
//  MontyHallParadox
//
//  Created by Vladimir Izmaylov on 18.01.2022.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [.red, .blue, .red]),
                startPoint: .topTrailing,
                endPoint: .bottomLeading
            )
                .ignoresSafeArea()
                .opacity(0.8)
        VStack(alignment: .center, spacing: 20) {
        Text("Monty Hall Paradox")
            .font(.system(size: 40))
            .fontWeight(.bold)
            .multilineTextAlignment(.center)
            .lineLimit(2)
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

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
