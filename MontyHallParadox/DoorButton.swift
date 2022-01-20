//
//  ButtonLabel.swift
//  Monty Hall Paradox
//
//  Created by Vladimir Izmaylov on 25.11.2021.
//

import SwiftUI

struct DoorButton: View {
    
    @State private var buttonTapped = false
    @State private var strokeColor: Color = .white
    
    let action: () -> Void
    
    let doorNumber: Int
    let whichDoorTap: Int
    let doorWinner: Int
    let okButtonScore: Int
    let doorLooser: Int
    
//    let strokeColor: Color
//    let doorColor: Color
//    let showGoat: Bool
//    let showCar: Bool
    
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
                                    .foregroundColor(changeStrokeColor())
                            )
                            .padding()
                        Text("\(doorNumber)")
                            .foregroundColor(.black)
                            .font(.title)
                            .bold()
                            .shadow(radius: 70)
                        Image("goat")
                            .resizable()
                            .scaledToFit()
                            .aspectRatio(2, contentMode: .fit)
                            .opacity(doorLooser == doorNumber ? 1 : 0)
                            .animation(.default, value: doorLooser == doorNumber)
                        Image(systemName: "car")
                            .resizable()
                            .scaledToFit()
                            .aspectRatio(2.5, contentMode: .fit)
                            .opacity(doorWinner == doorNumber && okButtonScore == 2 ? 1 : 0)
                            .animation(.default, value: doorWinner == doorNumber && okButtonScore == 2 ? 1 : 0)
                            .foregroundColor(.black)
                    }
                }
            }
        }
        .animation(.default, value: buttonTapped)
    }
    
    private func setDoorColor() -> Color {
        if doorWinner == doorNumber && whichDoorTap == doorNumber && okButtonScore == 2 { return .green }
        else if doorWinner != doorNumber && whichDoorTap == doorNumber && okButtonScore == 2 || doorLooser == doorNumber { return .red }
        else { return .orange }
    }
    
    private func changeStrokeColor() -> Color {
        doorNumber == whichDoorTap ? .red : .white
    }
    
//    private func showGoat() -> Bool {
//        doorLooser == doorNumber ? true : false
//    }
//
//    private func showCar() -> Bool {
//        doorWinner == doorNumber || okButtonScore == 2 ? true : false
//    }
}

struct ButtonLabel_Previews: PreviewProvider {
    static var previews: some View {
        DoorButton(action: {}, doorNumber: 1, whichDoorTap: 2, doorWinner: 2, okButtonScore: 1, doorLooser: 3)
    }
}
