//
//  ResultView.swift
//  MontyHallParadox
//
//  Created by Vladimir Izmaylov on 28.11.2021.
//

import SwiftUI

struct ResultView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var stats: FetchedResults<StatsOfStayingGames>

    let result: Bool
    let MainView: MainView
    
    let numberOfStayGames: Int
    let numberOfSwitchedGames: Int
    let numberOfWinsStayGames: Int
    let numberOfWinsSwitchedGames: Int
    
    
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
                        Text("Stay Stats")
                        Text("Number of Games: \(numberOfStayGames)")
                        Text("Number of Games Won: \(numberOfWinsStayGames)")
                        Text("Winning Percentage: \(countPercentOfStayGamesWins())%")
                    }
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Switched Stats")
                        Text("Number of Games: \(numberOfSwitchedGames)")
                        Text("Number of Games Won: \(numberOfWinsSwitchedGames)")
                        Text("Winning Percentage: \(countPercentOfSwitchedGamesWins())%")
                    }
                }
                }
                    .foregroundColor(.white)
                    .padding()
                    .padding(.bottom, 100)
            )
            .overlay(alignment: .bottom) {
                Button("Dismiss") {
                    presentationMode.wrappedValue.dismiss();
                    MainView.shuffleTheAnswers();
                    saveStatToDataManager()
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
        if numberOfStayGames != 0 {
            result = String(format: "%.1f", Double(numberOfWinsStayGames) / Double(numberOfStayGames) * 100)
        } else { result = "0" }
        return result
    }
    
    private func countPercentOfSwitchedGamesWins() -> String {
        var result: String
        if numberOfSwitchedGames != 0 {
            result = String(format: "%.1f", Double(numberOfWinsSwitchedGames) / Double(numberOfSwitchedGames) * 100)
        } else { result = "0" }
        return result
    }
    
    private func saveStatToDataManager() {
        let statsForStayingGame = StatsOfStayingGames(context: moc)
        statsForStayingGame.id = UUID()
        statsForStayingGame.numberOfStayGames = Int16(numberOfStayGames)
        statsForStayingGame.numberOfWinsStayGames = Int16(numberOfWinsStayGames)
        
        try? moc.save()
    
}
}
struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView(result: true, MainView: MainView(), numberOfStayGames: 3, numberOfSwitchedGames: 5, numberOfWinsStayGames: 1, numberOfWinsSwitchedGames: 1)
    }
}
