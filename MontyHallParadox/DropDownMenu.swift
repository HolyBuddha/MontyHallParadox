//
//  DropDownMenu.swift
//  MontyHallParadox
//
//  Created by Vladimir Izmaylov on 11.01.2022.
//

import SwiftUI

struct DropDownMenu: View {
    
    @State private var expand = false
    
    let actionFirstButton: () -> Void
    let actionSecondButton: () -> Void
    let actionThirdButton: () -> Void
    
    let textFirstButton: String
    let textSecondButton: String
    let textThirdButton: String
    
    let buttonColor: Color
    
    var body: some View {
        ZStack {
            VStack(alignment: .center, spacing: 10) {
            Button(
                action: { expand.toggle() },
                label: {
                    Image(systemName: "questionmark.circle.fill")
                        .frame(width: 50, height: 50)
                        .foregroundColor(buttonColor)
                        .font(.headline)
                }
            )
                    .opacity(expand ? 0 : 1)
                
            if expand {
                VStack(){
                    Button(textFirstButton, action: { self.expand.toggle(); actionFirstButton() })
                    Button(textSecondButton, action: { self.expand.toggle(); actionSecondButton() })
                    Button(textThirdButton, action: { self.expand.toggle(); actionThirdButton() })
                }
                
            }
        }
        .padding()
        .cornerRadius(10)
        .foregroundColor(buttonColor)
    }
        .animation(.spring(), value: expand)
    }
}

struct DropDownMenu_Previews: PreviewProvider {
    static var previews: some View {
        DropDownMenu(actionFirstButton: {}, actionSecondButton: {}, actionThirdButton: {}, textFirstButton: "1", textSecondButton: "2", textThirdButton: "3", buttonColor: .orange)
    }
}
