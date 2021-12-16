//
//  ResultView.swift
//  MontyHallParadox
//
//  Created by Vladimir Izmaylov on 28.11.2021.
//

import SwiftUI

struct ResultView: View {
    
    let result: String
    let MainView: MainView
    
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        ZStack{
            Color.blue
                .ignoresSafeArea()
            VStack(alignment: .center, spacing: 50) {
                Text(result)
                    .foregroundColor(.white)
                Button("Dismiss") { presentationMode.wrappedValue.dismiss(); MainView.shuffleTheAnswers()}
                .frame(width: 80, height: 30)
                .foregroundColor(.white)
                .background(.yellow)
                .cornerRadius(20)
                
            }
        }
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView(result: "You lose", MainView: MainView())
    }
}
