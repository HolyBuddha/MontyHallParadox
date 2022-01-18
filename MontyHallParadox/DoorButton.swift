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
    let strokeColor: Color
    let doorNumber: String
    let doorColor: Color
    let showGoat: Bool
    
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
                            .foregroundColor(doorColor)
                            .shadow(radius: 30)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(lineWidth: 4)
                                    .foregroundColor(strokeColor)
                            )
                            .padding()
                        Text(doorNumber)
                            .foregroundColor(.black)
                            .font(.title)
                            .bold()
                            .shadow(radius: 70)
                        Image("goat")
                            .resizable()
                            .scaledToFit()
                            .aspectRatio(2, contentMode: .fit)
                            .opacity(showGoat ? 1 : 0)
                    }
                }
            }
        }
        .animation(.default, value: buttonTapped)
    }
}

struct ButtonLabel_Previews: PreviewProvider {
    static var previews: some View {
        DoorButton(action: {}, strokeColor: .white, doorNumber: "1", doorColor: .red, showGoat: true)
    }
}
