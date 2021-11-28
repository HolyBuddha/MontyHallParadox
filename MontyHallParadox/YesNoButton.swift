//
//  YesNoButton.swift
//  MontyHallParadox
//
//  Created by Vladimir Izmaylov on 28.11.2021.
//

import SwiftUI

struct YesNoButton: View {
    let hideButton: Bool
    let action: () -> Void
    let text: String
    
    var body: some View {
        Button(text, action: {})
            .frame(width: 100, height: 45)
            .font((.system(size: 30, weight: .bold, design: .rounded)))
            .foregroundColor(.white)
            .background(.orange)
            .cornerRadius(20)
            .opacity(hideButton ? 0 : 1)
}
}

struct YesNoButton_Previews: PreviewProvider {
    static var previews: some View {
        YesNoButton(hideButton: false, action: {}, text: "Yes")
    }
}
