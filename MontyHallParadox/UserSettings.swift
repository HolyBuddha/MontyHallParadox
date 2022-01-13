//
//  DataManager.swift
//  MontyHallParadox
//
//  Created by Vladimir Izmaylov on 03.12.2021.
//

import Foundation
import Combine


class UserSettings: ObservableObject {
    
    let statistics = Statistics()
    
    @Published var numberOfStayGames = 0 {
        didSet {
            UserDefaults.standard.set(numberOfStayGames, forKey: "numberOfStayGames")
        }
    }
    
    @Published var numberOfSwitchedGames = 0 {
        didSet {
            UserDefaults.standard.set(numberOfSwitchedGames, forKey: "numberOfSwitchedGames")
        }
    }
    
    @Published var numberOfWinsStayGames = 0 {
        didSet {
            UserDefaults.standard.set(numberOfWinsStayGames, forKey: "numberOfWinsStayGames")
        }
    }
    
    @Published var numberOfWinsSwitchedGames = 0 {
        didSet {
            UserDefaults.standard.set(numberOfWinsSwitchedGames, forKey: "numberOfWinsSwitchedGames")
        }
    }

    
    init() {
        self.numberOfStayGames = UserDefaults.standard.integer(forKey: "numberOfStayGames")
        self.numberOfSwitchedGames = UserDefaults.standard.integer(forKey: "numberOfSwitchedGames")
        self.numberOfWinsStayGames = UserDefaults.standard.integer(forKey: "numberOfWinsStayGames")
        self.numberOfWinsSwitchedGames = UserDefaults.standard.integer(forKey: "numberOfWinsSwitchedGames")
    }
    
    func clearstats() {
        numberOfStayGames = 0
        numberOfSwitchedGames = 0
        numberOfWinsStayGames = 0
        numberOfWinsSwitchedGames = 0
    }
}

