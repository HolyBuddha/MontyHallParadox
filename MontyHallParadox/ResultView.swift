//
//  ResultView.swift
//  MontyHallParadox
//
//  Created by Vladimir Izmaylov on 28.11.2021.
//

import SwiftUI

struct ResultView: View {
    
    let result: Bool
    let MainView: MainView
    
    let numberOfStayGames: Int
    let numberOfSwitchedGames: Int
    let numberOfWinsStayGames: Int
    let numberOfWinsSwitchedGames: Int
    
    @State private var percentOfStayGamesWins: Double = 0
    @State private var percentOfSwitchedGamesWins: Double = 0
    
    
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        Color.blue
            .ignoresSafeArea()
            .overlay(
                VStack(alignment: .leading, spacing: 40) {
                    Text(showMainText())
                        .font(.largeTitle)
                    VStack(alignment: .leading, spacing: 10) {
                    Text("Stay stats")
                    Text("Number of games: \(numberOfStayGames)")
                    Text("Number of win games: \(numberOfWinsStayGames)")
                    Text("Percent of wins: \(percentOfStayGamesWins)")
                    }
                    VStack(alignment: .leading, spacing: 10) {
                    Text("Switched stats")
                    Text("Number of games: \(numberOfSwitchedGames)")
                    Text("Number of win games: \(numberOfWinsSwitchedGames)")
                    Text("Percent of wins: \(percentOfSwitchedGamesWins)")
                }
                    Text("\(numberOfStayGames + numberOfSwitchedGames)")
                }
                    .foregroundColor(.white)
                    .padding()
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
    private func showMainText() -> String {
        result ? "Congratulations, you won!" : "Sorry, but you lose"
    }
//    private func percentOfWins() -> Double {
//        result ? 
//    }
}
struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView(result: true, MainView: MainView(), numberOfStayGames: 3, numberOfSwitchedGames: 5, numberOfWinsStayGames: 1, numberOfWinsSwitchedGames: 1)
    }
}
