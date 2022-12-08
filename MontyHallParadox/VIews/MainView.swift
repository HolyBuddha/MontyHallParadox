//
//  ContentView.swift
//  Monty Hall Paradox
//
//  Created by Vladimir Izmaylov on 25.11.2021.
//

import SwiftUI

struct MainView: View {
    
    @ObservedObject var userSettings = UserSettings()
    
    @State private var whichDoorTap = 0
    @State private var firstDoorCount = 0
    @State private var secondDoorCount = 0
    
    
    @State private var doorWinner = Int.random(in: 1...3)
    
    @State private var result = ""
    @State private var doorLooser = 0
    @State private var doorTapButton = false
    @State private var okTapButton = false
    @State private var alertTapButton = false
    @State private var okButtonScore = 0
    @State private var showInfoView = false
    
    var body: some View {
        NavigationView {
            ZStack {
                GeometryReader{ geometry in
                    let sideWidth = geometry.size.width - 100
                    let sideHeight = geometry.size.height * 0.3
                    LinearGradient(
                        gradient: Gradient(colors: [.red, .blue]),
                        startPoint: .bottom,
                        endPoint: .top
                    )
                    .ignoresSafeArea()
                    .opacity(0.8)
                    VStack(alignment: .center){
                        Text(
                            changeMainText())
                        .font(.title)
                        .bold()
                        .foregroundColor(.white)
                        .frame(width: sideWidth, height: sideHeight)
                        .multilineTextAlignment(.center)
                        .shadow(radius: 70)
                        .toolbar {
                            ToolbarItem(placement: .navigationBarTrailing) {
                                DropMenuForNavigationBar(
                                    actionFirstButton: {},
                                    actionSecondButton: {
                                        userSettings.clearstats()
                                    },
                                    actionThirdButton: {
                                        showInfoView.toggle()
                                    },
                                    textFirstButton: "Play",
                                    textSecondButton: "Clear stats",
                                    textThirdButton: "Help",
                                    buttonColor: .white
                                )
                                
                            }
                        }
                        HStack(alignment: .center, spacing: 30) {
                            DoorButton(
                                action: { firstDoorTapped() },
                                doorNumber: 1,
                                whichDoorTap: whichDoorTap,
                                doorWinner: doorWinner,
                                okButtonScore: okButtonScore,
                                doorLooser: doorLooser
                            )
                            .disabled(doorLooser == 1)
                            
                            DoorButton(action: { secondDoorTapped() },
                                       doorNumber: 2,
                                       whichDoorTap: whichDoorTap,
                                       doorWinner: doorWinner,
                                       okButtonScore: okButtonScore,
                                       doorLooser: doorLooser
                            )
                            .disabled(doorLooser == 2)
                            
                            DoorButton(action: { thirdDoorTapped() },
                                       doorNumber: 3,
                                       whichDoorTap: whichDoorTap,
                                       doorWinner: doorWinner,
                                       okButtonScore: okButtonScore,
                                       doorLooser: doorLooser
                            )
                            .disabled(doorLooser == 3)
                        }
                        .frame(alignment: .center)
                        .padding(.leading, 25)
                        
                        Button("Submit", action: {
                            okButtonTapped();
                        }
                        )
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
                        .padding(.bottom, 40)
                        .alert(result, isPresented: $okTapButton) {
                            Button("OK") { alertTapButton.toggle() }
                        }
                        .fullScreenCover(isPresented: $alertTapButton) {
                            ResultView(
                                result: winLoseText(),
                                mainView: self
                            )
                        }
                        .fullScreenCover(isPresented: $showInfoView) {
                            HelpView(infoText: InfoText())
                        }
                    }
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
        if okButtonScore == 2 {
            okTapButton.toggle();
            secondDoorCount = whichDoorTap;
            gamesCount();
            gamesWinsCount()
        } else {
            firstDoorCount = whichDoorTap
            doorTapped()
        }
    }
    
    func shuffleTheAnswers() {
        doorWinner = Int.random(in: 1...3)
        doorLooser = 0
        firstDoorCount = 0
        secondDoorCount = 0
        okButtonScore = 0
    }
    
    private func changeMainText() -> String {
        switch okButtonScore {
        case 0: return "Please choose your door"
        case 1: return """
        The Door \(doorLooser) is lose.
        Do you want to change your door?
        """
        default: return "\(result)"
        }
    }
    private func doorTapped() {
        switch doorWinner {
        case 1 : result = "First Door Win";
            doorLooser = whichDoorTap == 2 ? 3 : 2
        case 2 : result = "Second Door Win";
            doorLooser = whichDoorTap == 1 ? 3 : 1
        default: result = "Third Door Win";
            doorLooser = whichDoorTap == 1 ? 2 : 1
        }
    }
    
    private func gamesCount() {
        if firstDoorCount == secondDoorCount { userSettings.numberOfStayGames += 1 }
        else { userSettings.numberOfSwitchedGames += 1 }
    }
    
    private func gamesWinsCount() {
        if firstDoorCount == secondDoorCount && doorWinner == whichDoorTap { userSettings.numberOfWinsStayGames += 1
        }
        else if firstDoorCount != secondDoorCount && doorWinner == whichDoorTap { userSettings.numberOfWinsSwitchedGames += 1 }
    }
    
    private func winLoseText() -> Bool {
        doorWinner == whichDoorTap
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
