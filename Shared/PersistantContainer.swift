//
//  PersistantContainer.swift
//  WaterControllApp WatchKit Extension
//
//  Created by Физтех.Радио on 23.03.2021.
//

import CoreData

struct PersistentController {
    static let shared = PersistentController()
    
    let container: NSPersistentContainer
    
    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "WaterApp")
        if(inMemory) {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                print("Unresolved error \(error), \(error.userInfo)")
            }
        })
    }
}
