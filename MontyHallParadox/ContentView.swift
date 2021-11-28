//
//  ContentView.swift
//  Monty Hall Paradox
//
//  Created by Vladimir Izmaylov on 25.11.2021.
//

import SwiftUI

struct ContentView: View {
    @State private var userTapButton = false
    @State private var buttonScore = 0
    
    @State private var strokeColor1: Color = .white
    @State private var strokeColor2: Color = .white
    @State private var strokeColor3: Color = .white
    
    var body: some View {
        ZStack {
            Color.blue
                .ignoresSafeArea()
                .opacity(0.7)
            VStack(spacing: 30){
                Text(changeMainText())
                    .font(.title)
                    .bold()
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .frame(width: 250, height: 100)
                HStack(spacing: 30){
                    ButtonLabel(color: .orange, action: {
                        buttonDoorTapped();
                        changeStrokeColor1()
                    }, strokeColor: strokeColor1)
                    
                    ButtonLabel(color: .orange, action: {
                        buttonDoorTapped();
                        changeStrokeColor2()
                    }, strokeColor: strokeColor2)
                }
                ButtonLabel(color: .orange
                            , action: {
                    buttonDoorTapped();
                    changeStrokeColor3()
                }, strokeColor: strokeColor3)
                Button("OK", action: {})
                    .frame(width: 80, height: 40)
                    .background(userTapButton ? .green : .white)
                    .cornerRadius(20)
                    .disabled(!userTapButton)
                    .opacity(userTapButton ? 1 : 0)
                    .foregroundColor(.white)
                    //.padding()
                Spacer()
                }
            
        
            }
      
        }
}

extension ContentView {
    private func buttonDoorTapped() {
        //buttonScore += 1
        userTapButton = true
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
        switch buttonScore {
        case 1: return "Do you want to change your door?"
        default:
            return "Choose your door"
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
