//
//  ButtonLabel.swift
//  Monty Hall Paradox
//
//  Created by Vladimir Izmaylov on 25.11.2021.
//

import SwiftUI

struct ButtonLabel: View {
    let action: () -> Void
    let strokeColor: Color
    let doorNumber: Int
    
    var body: some View {
        
        Button() {
            action()
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
                        .foregroundColor(.orange)
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
}
struct ButtonLabel_Previews: PreviewProvider {
    static var previews: some View {
        ButtonLabel(action: {}, strokeColor: .white, doorNumber: 1)
    }
}
