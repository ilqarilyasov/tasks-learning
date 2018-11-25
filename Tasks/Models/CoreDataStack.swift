//
//  CoreDataStack.swift
//  Tasks
//
//  Created by Ilgar Ilyasov on 11/25/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation
import CoreData

class CoreDataStack {
    
    static let shared = CoreDataStack()
    
    lazy var container: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Tasks") //Need to be same name as the app
        container.loadPersistentStores { (_, error) in
            if let error = error {
                fatalError("Failed to load persistent store: \(error)")
            }
        }
        return container
    }()
    
    var mainContext: NSManagedObjectContext {
        return container.viewContext
    }
}
