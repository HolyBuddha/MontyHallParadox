//
//  SwiftUIView.swift
//  MontyHallParadox
//
//  Created by Vladimir Izmaylov on 02.12.2021.
//

import SwiftUI

struct SwiftUIView: View {
    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            let height = geometry.size.height
            
            ZStack {
                Rectangle()
                    .frame(width: width * 0.5, height: height * 0.4)
                    .foregroundColor(.orange)
//                Image(systemName: "airplane")
//                    .resizable()
//                    .scaleEffect(0.3)
            }
        }
    }
}
    struct SwiftUIView_Previews: PreviewProvider {
        static var previews: some View {
            SwiftUIView()
        }
    }
