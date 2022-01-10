//
//  ResultView.swift
//  MontyHallParadox
//
//  Created by Vladimir Izmaylov on 28.11.2021.
//

import SwiftUI

struct ResultView: View {
    
    @ObservedObject var userSettings = UserSettings()
    
    let result: Bool
    let mainView: MainView

    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        Color.blue
            .ignoresSafeArea()
            .overlay(
                Group{
                VStack(alignment: .leading, spacing: 40) {
                    Text(showMainText())
                        .font(.largeTitle)
                        .padding(.bottom, 50)
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Stay stats")
                        Text("Number of games: \(userSettings.numberOfStayGames)")
                        Text("Number of win games: \(userSettings.numberOfWinsStayGames)")
                        Text("Winning Percentage: \(countPercentOfStayGamesWins())%")
                    }
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Switched stats")
                        Text("Number of games: \(userSettings.numberOfSwitchedGames)")
                        Text("Number of win games: \(userSettings.numberOfWinsSwitchedGames)")
                        Text("Winning Percentage: \(countPercentOfSwitchedGamesWins())%")
                    }
                }
                }
                    .foregroundColor(.white)
                    .padding()
                    .padding(.bottom, 100)
            )
            .overlay(alignment: .bottom) {
                Button("Dismiss") { presentationMode.wrappedValue.dismiss(); mainView.shuffleTheAnswers()
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
    
    private func countPercentOfStayGamesWins() -> String {
        var result: String
        if userSettings.numberOfStayGames != 0 {
            result = String(format: "%.1f", Double(userSettings.numberOfWinsStayGames) / Double(userSettings.numberOfStayGames) * 100)
        } else { result = "0" }
        return result
    }
    
    private func countPercentOfSwitchedGamesWins() -> String {
        var result: String
        if userSettings.numberOfSwitchedGames != 0 {
            result = String(format: "%.1f", Double(userSettings.numberOfWinsSwitchedGames) / Double(userSettings.numberOfSwitchedGames) * 100)
        } else { result = "0" }
        return result
    }
    
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView(result: true, mainView: MainView())
    }
}
