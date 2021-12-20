//
//  ContentView.swift
//  Monty Hall Paradox
//
//  Created by Vladimir Izmaylov on 25.11.2021.
//

import SwiftUI

struct MainView: View {
    // Добавь статистику по процентам на резалт вью
    // Добавь свойство для победы/поражения
    // добавь userDefaults
    
    @State private var whichDoorTap = 0
    @State private var firstDoorCount = 0
    @State private var secondDoorCount = 0
   
    
    @State private var doorWinner = Int.random(in: 1...3)
    
    @State private var result: String = "You lose"
    @State private var doorLooser = 0
    
    @State private var doorTapButton = false
    @State private var okTapButton = false
    @State private var okButtonScore = 0
    
    @State private var numberOfStayGames = 0
    @State private var numberOfSwitchedGames = 0
        
    var body: some View {
        NavigationView{
            ZStack {
                LinearGradient(
                    gradient: Gradient(colors: [.green, .blue]),
                    startPoint: UnitPoint(x: 0, y: -1),
                    endPoint: UnitPoint(x: -1, y: 0)
                )
                    .ignoresSafeArea()
                    .opacity(0.5)
                VStack(alignment: .center){
                    Text(changeMainText())
                        .font(.title)
                        .bold()
                        .foregroundColor(.white)
                        .frame(width: 200, height: 200)
                        .multilineTextAlignment(.center)
                    HStack(spacing: 30) {
                        Spacer()
                        ButtonLabel(
                            action: {
                                firstDoorTapped();
                            },
                            strokeColor: whichDoorTap == 1 ? .red : .white,
                            doorNumber: 1,
                            doorColor: doorLooser == 1 ? .red : .orange
                        )
                            .disabled(doorLooser == 1)
                        
                        ButtonLabel(
                            action: {
                                secondDoorTapped();
                            },
                            strokeColor: whichDoorTap == 2 ? .red : .white,
                            doorNumber: 2,
                            doorColor: doorLooser == 2 ? .red : .orange
                        )
                            .disabled(doorLooser == 2)
                        
                        ButtonLabel(
                            action: {
                                thirdDoorTapped();
                            },
                            strokeColor: whichDoorTap == 3 ? .red : .white,
                            doorNumber: 3,
                            doorColor: doorLooser == 3 ? .red : .orange
                        )
                            .disabled(doorLooser == 3)
                    }
                    .frame(alignment: .center)
                    Spacer()
                    Button("Submit", action: {okButtonTapped(); DoorTapped()})
                        .fullScreenCover(isPresented: $okTapButton) {
                            ResultView(result: result, MainView: self, numberOfStayGames: numberOfStayGames, numberOfSwitchedGames: numberOfSwitchedGames
                            )
                        }
                        .frame(width: 80, height: 40)
                        .cornerRadius(20)
                        .background(.green)
                        .disabled(!doorTapButton)
                        .foregroundColor(.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.white, lineWidth: 5)
                        )
                        .cornerRadius(20)
                        .opacity(doorTapButton ? 1 : 0)
                        .padding()
                    Text("\(doorWinner)")
                        .foregroundColor(.white)
                }
            }
        }
    }
}

extension MainView {
    private func  firstDoorTapped() {
        whichDoorTap = 1
        doorTapButton = true
    }
    
    private func secondDoorTapped() {
        whichDoorTap = 2
        doorTapButton = true
    }
    
    private func thirdDoorTapped() {
        whichDoorTap = 3
        doorTapButton = true
    }
    
    private func okButtonTapped() {
        okButtonScore += 1
        if okButtonScore == 2 { okTapButton.toggle(); okButtonScore = 0; secondDoorCount = whichDoorTap; GamesCount()
        } else { firstDoorCount = whichDoorTap }
    }
    
    func shuffleTheAnswers() {
        doorWinner = Int.random(in: 1...3)
        doorLooser = 0
        firstDoorCount = 0
        secondDoorCount = 0
    }
    
    private func changeMainText() -> String {
        switch okButtonScore {
        case 1: return "The Door \(doorLooser) is lose. Do you want to change your door?"
        default:
            return "Please choose your door"
        }
    }
    private func DoorTapped() {
        switch doorWinner {
        case 1 : result = "First Door Win"; doorLooser = whichDoorTap == 2 ? 3 : 2
        case 2 : result = "Second Door Win"; doorLooser = whichDoorTap == 1 ? 3 : 1
        default: result = "Third Door Win"; doorLooser = whichDoorTap == 1 ? 2 : 1
        }
    }
    
    private func GamesCount() {
        if firstDoorCount == secondDoorCount { numberOfStayGames += 1 } else { numberOfSwitchedGames += 1 }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
