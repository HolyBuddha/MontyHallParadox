//
//  Monty_Hall_ParadoxApp.swift
//  Monty Hall Paradox
//
//  Created by Vladimir Izmaylov on 25.11.2021.
//

import SwiftUI

@main
struct MontyHallParadoxApp: App {
    
    @StateObject private var dataManager = DataManager()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environment(\.managedObjectContext, dataManager.container.viewContext)
        }
    }
}
