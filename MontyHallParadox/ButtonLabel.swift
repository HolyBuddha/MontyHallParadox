//
//  ButtonLabel.swift
//  Monty Hall Paradox
//
//  Created by Vladimir Izmaylov on 25.11.2021.
//

import SwiftUI

struct ButtonLabel: View {
    let color: Color
    let action: () -> Void
    let strokeColor: Color
    
    var body: some View {
        Button {
            action()
        } label: {
            //        GeometryReader { geometry in
            //            let sideLength = geometry.size.width
            Rectangle()
                .cornerRadius(10)
            //.opacity(disabled ? 0 : 1)
                .frame(width: 100, height: 200)
                .foregroundColor(color)
                .shadow(radius: 30)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 4)
                        .foregroundColor(strokeColor)
                    //.opacity(disabled ? 0 : 1)
                )
        }
    }
}
struct ButtonLabel_Previews: PreviewProvider {
    static var previews: some View {
        ButtonLabel(color: .red, action: {}, strokeColor: .white)
    }
}
