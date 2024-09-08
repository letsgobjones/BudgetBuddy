//
//  CoreDataManager.swift
//  BudgetBuddy
//
//  Created by Brandon Jones on 8/29/24.
//

import Foundation
import CoreData


class CoreDataManager {
  
  static let shared = CoreDataManager()
  private var persistentContainer: NSPersistentContainer
  
  private init() {
    persistentContainer = NSPersistentContainer(name: "BudgetModel")
    persistentContainer.loadPersistentStores { description, error in
      if let error {
        fatalError("Unable to initialize Core Data stack \(error)")
      }
    }
  }
  
  var viewContect: NSManagedObjectContext {
    persistentContainer.viewContext
  }
  
}
