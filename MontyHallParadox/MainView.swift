//
//  ContentView.swift
//  Monty Hall Paradox
//
//  Created by Vladimir Izmaylov on 25.11.2021.
//

import SwiftUI

struct MainView: View {
    // Настрой переход с экрана на экран
    @State private var doorTapButton = false
    @State private var okTapButton = false
    @State private var okButtonScore = 0
    
    @State private var strokeColor1: Color = .white
    @State private var strokeColor2: Color = .white
    @State private var strokeColor3: Color = .white
    
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [.green, .blue]),
                startPoint: UnitPoint(x: 0, y: -1),
                endPoint: UnitPoint(x: -1, y: 0)
            )
                .ignoresSafeArea()
                .opacity(0.5)
            VStack(spacing: 30){
                Text(changeMainText())
                    .font(.title)
                    .bold()
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .frame(width: 250, height: 100)
                HStack(spacing: 30){
                    ButtonLabel(color: .orange, action: {
                        doorButtonTapped();
                        changeStrokeColor1()
                    },
                                strokeColor: strokeColor1)
                    
                    ButtonLabel(color: .orange, action: {
                        doorButtonTapped();
                        changeStrokeColor2()
                    },
                                strokeColor: strokeColor2)
                }
                
                ButtonLabel(color: .orange, action: {
                    doorButtonTapped();
                    changeStrokeColor3()
                },
                            strokeColor: strokeColor3)
                
                Button("OK", action: {okButtonTapped()})
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
                Spacer()
            }
            
            
        }
        
    }
}

extension MainView {
    private func doorButtonTapped() {
        doorTapButton = true
    }
    
    private func okButtonTapped() {
        okButtonScore += 1
        if okButtonScore == 2 { okTapButton }
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
    
    
    private func changeMainText() -> String {
        switch okButtonScore {
        case 1: return "Do you want to change your door?"
        default:
            return "Choose your door"
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
