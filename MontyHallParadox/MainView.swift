//
//  ContentView.swift
//  Monty Hall Paradox
//
//  Created by Vladimir Izmaylov on 25.11.2021.
//

import SwiftUI

struct MainView: View {
    // Поработай над кнопками и интерфейсом
    // Нажатая дверь не должна отображаться как неправильная, исправь
    
    @State private var whichDoorTap = 0
   
    
    @State private var doorWinner = Int.random(in: 1...3)
    
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
                                firstDoorTapped();
                                changeStrokeColor1()
                            },
                            strokeColor: strokeColor1,
                            doorNumber: 1
                        )
                        
                        ButtonLabel(
                            action: {
                                secondDoorTapped();
                                changeStrokeColor2()
                            },
                            strokeColor: strokeColor2,
                            doorNumber: 2
                        )
                        ButtonLabel(
                            action: {
                                thirdDoorTapped();
                                changeStrokeColor3()
                            },
                            strokeColor: strokeColor3,
                            doorNumber: 3
                        )
                    }
                    .frame(alignment: .center)
                    Spacer()
                    Button("Submit", action: {okButtonTapped(); DoorTapped()})
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
        if okButtonScore == 2 { okTapButton.toggle(); okButtonScore = 0;
            //doorTapButton.toggle()
        } else { shuffleTheAnswers() }
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
        doorWinner = Int.random(in: 1...3)
    }
    
    private func changeMainText() -> String {
        switch okButtonScore {
        case 1: return "The Door \(doorLooser) is lose. Do you want to change your door?"
        default:
            return "Choose your door"
        }
    }
    private func DoorTapped() {
        switch doorWinner {
        case 1 : result = "First Door Win"; doorLooser = 2
        case 2 : result = "Second Door Win"; doorLooser = 3
        default: result = "Third Door Win"; doorLooser = 1
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
