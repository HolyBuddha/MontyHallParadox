//
//  InfoView.swift
//  MontyHallParadox
//
//  Created by Vladimir Izmaylov on 05.09.2022.
//

import SwiftUI

struct HelpView: View {
    let infoText: InfoText
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [.red, .blue, .red]),
                startPoint: .topTrailing,
                endPoint: .bottomLeading
            )
            .ignoresSafeArea()
            .opacity(0.8)
            VStack(alignment: .center, spacing: 20) {
                Text("Game Info")
                    .font(.system(size: 40))
                    .fontWeight(.bold)
                Text(infoText.textForHelpScreen)
                    .font(.system(size: 20))
                Button("Dismiss") {
                    presentationMode.wrappedValue.dismiss()
                }
                .frame(width: 100, height: 40)
                .foregroundColor(.white)
                .background(.green)
                .cornerRadius(20)
                .padding(30)
            }
            .padding(.all, 30)
            .foregroundColor(.white)
            .multilineTextAlignment(.center)
            .offset(y: -50)
        }
    }
}
struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        HelpView(infoText: InfoText())
    }
}
