//
//  ContentView.swift
//  Monty Hall Paradox
//
//  Created by Vladimir Izmaylov on 25.11.2021.
//

import SwiftUI

struct MainView: View {
    // Поработай над кнопками и интерфейсом
    // Рефактори логику
    
    @State private var doorWinner = DataManager.shared.randomDoorWinner.shuffled()
    
    @State private var result: String = "You lose"
    @State private var doorLooser = 0
    
    @State private var doorTapButton = false
    @State private var okTapButton = false
    @State private var okButtonScore = 0
    
    @State private var strokeColor1: Color = .white
    @State private var strokeColor2: Color = .white
    @State private var strokeColor3: Color = .white
    
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
                                doorButtonTapped();
                                changeStrokeColor1()
                                firstDoorTapped()
                            },
                            strokeColor: strokeColor1,
                            doorNumber: 1
                            )
                        
                        ButtonLabel(
                            action: {
                                doorButtonTapped();
                                changeStrokeColor2()
                                secondDoorTapped()
                            },
                            strokeColor: strokeColor2,
                            doorNumber: 2
                        )
                        ButtonLabel(
                            action: {
                                doorButtonTapped();
                                changeStrokeColor3()
                                thirdDoorTapped()
                            },
                            strokeColor: strokeColor3,
                            doorNumber: 3
                            )
                    }
                    .frame(alignment: .center)
                    Spacer()
                    Button("Submit", action: {okButtonTapped()})
                        .sheet(isPresented: $okTapButton) { ResultView(result: result)
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
//                    Text(result)
//                        .foregroundColor(.white)
                }
            }
        }
    }
}

extension MainView {
    private func doorButtonTapped() {
        doorTapButton = true
    }
    
    private func okButtonTapped() {
        whichDoorsIsLose()
        okButtonScore += 1
        if okButtonScore == 2 { okTapButton.toggle(); okButtonScore = 0;   shuffleTheAnswers() }
    }
    private func changeStrokeColor1() {
        strokeColor1 = .red
        strokeColor2 = .white
        strokeColor3 = .white
    }
    private func changeStrokeColor2() {
        strokeColor1 = .white
        strokeColor2 = .red
        strokeColor3 = .white
    }
    private func changeStrokeColor3() {
        strokeColor1 = .white
        strokeColor2 = .white
        strokeColor3 = .red
    }
    
    private func shuffleTheAnswers() {
        doorWinner = DataManager.shared.randomDoorWinner.shuffled()
    }
    
    private func changeMainText() -> String {
        switch okButtonScore {
        case 1: return "The Door \(doorLooser) is lose. Do you want to change your door?"
        default:
            return "Choose your door"
        }
    }
    private func firstDoorTapped() {
        if doorTapButton == doorWinner[0] {
            result = "First Door Win"
        }
    }
    private func secondDoorTapped() {
        if doorTapButton == doorWinner[1] {
            result = "Second Door Win"
        }
    }
    private func thirdDoorTapped() {
        if doorTapButton == doorWinner[2] {
            result = "Third Door Win"
        }
    }
    private func whichDoorsIsLose() {
        doorLooser = (doorWinner.firstIndex(of: false) ?? 0) + 1
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
