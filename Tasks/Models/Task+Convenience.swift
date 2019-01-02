//
//  Task+Convenience.swift
//  Tasks
//
//  Created by Ilgar Ilyasov on 11/25/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation
import CoreData

enum TaskPriority: String {
    case low, normal, high, critical
}

extension Task {
    convenience init(name: String,
                     notes: String? = nil,
                     priority: TaskPriority = .normal,
                     managedObjectContex: NSManagedObjectContext = CoreDataStack.shared.mainContext) {
        
        self.init(context: managedObjectContex)
        
        self.name = name
        self.notes = notes
        self.priority = priority.rawValue
    }
}
