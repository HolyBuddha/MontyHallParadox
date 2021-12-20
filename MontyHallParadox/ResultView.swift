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
    let numberOfStayGames: Int
    let numberOfSwitchedGames: Int
    @State private var percentOfStayGamesWins: Double = 0
    @State private var percentOfSwitchedGamesWins: Double = 0
    @State private var sumOfGames: Int = 0
    
    
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        Color.blue
            .ignoresSafeArea()
            .overlay(
                VStack(alignment: .leading, spacing: 40) {
                    Text(result)
                        .font(.largeTitle)
                    VStack(alignment: .leading, spacing: 10) {
                    Text("Stay stats")
                    Text("Number of games: \(numberOfStayGames)")
                    Text("Percent of wins: \(percentOfStayGamesWins)")
                    }
                    VStack(alignment: .leading, spacing: 10) {
                    Text("Switched stats")
                    Text("Number of games: \(numberOfSwitchedGames)")
                    Text("Percent of wins: \(percentOfSwitchedGamesWins)")
                }
                }
                    .foregroundColor(.white)
                )
            .overlay(alignment: .bottom) {
                Button("Dismiss") { presentationMode.wrappedValue.dismiss(); MainView.shuffleTheAnswers();
                    }
                    .frame(width: 80, height: 30)
                    .foregroundColor(.white)
                    .background(.yellow)
                    .cornerRadius(20)
                    .padding()
            }
    }
    }

extension ResultView {
    func percentCount() {
        sumOfGames = numberOfStayGames + numberOfSwitchedGames
        
    }
}


struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView(result: "You lose", MainView: MainView(), numberOfStayGames: 3, numberOfSwitchedGames: 5)
    }
}
