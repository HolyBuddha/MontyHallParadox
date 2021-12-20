//
//  DataManager.swift
//  MontyHallParadox
//
//  Created by Vladimir Izmaylov on 03.12.2021.
//

import Foundation

var statistics: Statistics!

class DataManager {
    
    static let shared = DataManager()
    
    let randomDoorWinner = [true, false, false]
    
    private init() {}
    
}
