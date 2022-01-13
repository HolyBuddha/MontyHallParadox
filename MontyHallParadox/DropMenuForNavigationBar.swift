//
//  DropMenuForNavigationBar.swift
//  MontyHallParadox
//
//  Created by Vladimir Izmaylov on 14.01.2022.
//

import SwiftUI

struct DropMenuForNavigationBar: View {
    
    let actionFirstButton: () -> Void
    let actionSecondButton: () -> Void
    let actionThirdButton: () -> Void
    
    let textFirstButton: String
    let textSecondButton: String
    let textThirdButton: String
    
    let buttonColor: Color
    
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            Menu {
                Button(textFirstButton, action: actionFirstButton)
                Button(textSecondButton, action: actionSecondButton)
                Button(textThirdButton, action: actionThirdButton)
            }
        label: {
            Image(systemName: "ellipsis.circle")
        }
        }
        .foregroundColor(buttonColor)
        .padding(.trailing)
    }
}

struct DropMenuForNavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        DropMenuForNavigationBar(actionFirstButton: {}, actionSecondButton: {}, actionThirdButton: {}, textFirstButton: "1", textSecondButton: "2", textThirdButton: "3", buttonColor: .orange)
    }
}
