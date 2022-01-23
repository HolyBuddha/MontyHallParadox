//
//  ButtonLabel.swift
//  Monty Hall Paradox
//
//  Created by Vladimir Izmaylov on 25.11.2021.
//

import SwiftUI

struct DoorButton: View {
    
    @State private var buttonTapped = false
    
    let action: () -> Void
    
    let doorNumber: Int
    let whichDoorTap: Int
    let doorWinner: Int
    let okButtonScore: Int
    let doorLooser: Int
    
    var body: some View {
        
        VStack {
            Button() {
                action(); buttonTapped.toggle()
            } label: {
                GeometryReader { geometry in
                    let sideLength = geometry.size.width * 0.5
                    let sideHeight = geometry.size.height * 0.4
                    ZStack{
                        Rectangle()
                            .cornerRadius(10)
                            .frame(
                                width: sideLength,
                                height: sideHeight
                            )
                            .foregroundColor(setDoorColor())
                            .shadow(radius: 30)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(lineWidth: 4)
                                    .foregroundColor(.white)
                                    .opacity(doorNumber == whichDoorTap ? 1 : 0)
                            )
                            .rotation3DEffect(
                                Angle.degrees(
                                    showGoat() || showCar() ? 360 : 0
                                ),
                                axis: (x: 0, y: 1, z: 0)
                            )
                            .animation(.linear(duration: 0.5), value: showGoat() || showCar())
                            .padding()
                        Text("\(doorNumber)")
                            .foregroundColor(.black)
                            .font(.title)
                            .bold()
                            .opacity(showGoat() || showCar() ? 0 : 1)
                            .shadow(radius: 70)
                        Image("goat")
                            .resizable()
                            .scaledToFit()
                            .aspectRatio(2, contentMode: .fit)
                            .opacity(showGoat() ? 1 : 0)
                            .animation(.default, value: showGoat())
                        Image(systemName: "car")
                            .resizable()
                            .scaledToFit()
                            .aspectRatio(2.5, contentMode: .fit)
                            .opacity(showCar() ? 1 : 0)
                            .animation(.default, value: showCar())
                            .foregroundColor(.black)
                    }
                }
            }
        }
        .animation(.default, value: buttonTapped)
    }
    
    private func setDoorColor() -> Color {
        if showCar() { return .green.opacity(0.9) }
        else if showGoat() { return .red.opacity(0.9) }
        else { return .orange.opacity(0.9)}
    }
    
    private func changeStrokeColor() -> Bool {
        doorNumber == whichDoorTap
    }
    
    private func showGoat() -> Bool {
        if doorLooser == doorNumber { return true }
        else if doorWinner != doorNumber && okButtonScore == 2 { return true }
        else { return false }
    }
    
    private func showCar() -> Bool {
        doorWinner == doorNumber && okButtonScore == 2
    }
}

struct ButtonLabel_Previews: PreviewProvider {
    static var previews: some View {
        DoorButton(action: {}, doorNumber: 1, whichDoorTap: 2, doorWinner: 3, okButtonScore: 1, doorLooser: 1)
    }
}
