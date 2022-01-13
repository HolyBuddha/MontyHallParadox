//
//  ButtonLabel.swift
//  Monty Hall Paradox
//
//  Created by Vladimir Izmaylov on 25.11.2021.
//

import SwiftUI

struct ButtonLabel: View {
    
    @State private var buttonTapped = false
    
    let action: () -> Void
    let strokeColor: Color
    let doorNumber: Int
    let doorColor: Color
    
    var body: some View {
        
        VStack {
            Button() {
                action(); buttonTapped.toggle()
            } label: {
                GeometryReader { geometry in
                    let sideLength = geometry.size.width * 0.4
                    let sideHeight = geometry.size.height * 0.3
                    ZStack{
                        Rectangle()
                            .cornerRadius(10)
                        //.opacity(disabled ? 0 : 1)
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
                                //.opacity(disabled ? 0 : 1)
                            )
                            .padding()
                        Text("\(doorNumber)")
                            .foregroundColor(.black)
                            .font(.title)
                            .bold()
                            .shadow(radius: 70)
                    }
                }
            }
        }
//        .onTapGesture {
//            buttonTapped.toggle()
//        }
//        .rotation3DEffect(.degrees(buttonTapped ? 360 : 0), axis: (x: 0, y: 1, z: 0))
        //.scaleEffect(buttonTapped ? 1.1 : 1)
//        .rotation3DEffect(.degrees(buttonTapped ? 360 : 0), axis: (x: 0, y: 1, z: 0), anchor: .zero, anchorZ: 1, perspective: 0)
        .animation(.default, value: buttonTapped)
    }
}

struct ButtonLabel_Previews: PreviewProvider {
    static var previews: some View {
        ButtonLabel(action: {}, strokeColor: .white, doorNumber: 1, doorColor: .red)
    }
}
