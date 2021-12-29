//
//  DataManager.swift
//  MontyHallParadox
//
//  Created by Vladimir Izmaylov on 03.12.2021.
//

import Foundation
import CoreData

class DataManager: ObservableObject {
    let container = NSPersistentContainer(name: "CoreDataModelStats")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
        }
    }
}
