//
//  BudgetCategory+CoreDataClass.swift
//  BudgetBuddy
//
//  Created by Brandon Jones on 8/29/24.
//

import Foundation
import CoreData

@objc(BudgetCategory)
public class BudgetCategory: NSManagedObject {
    
  public override func awakeFromInsert() {
    self.dateCreated = Date()
  }
}
