//
//  StarterView.swift
//  MontyHallParadox
//
//  Created by Vladimir Izmaylov on 19.01.2022.
//

import SwiftUI

struct StarterView: View {
    
    @State private var isLoading = true
    
    var body: some View {
        Group {
        if isLoading { LoadingView() } else { MainView() }
        }
        .onAppear { fakeLoading() }
        
    }
}

struct StarterView_Previews: PreviewProvider {
    static var previews: some View {
        StarterView()
            
    }
}

extension StarterView {
    private func fakeLoading() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            isLoading = false
        }
    }
}
