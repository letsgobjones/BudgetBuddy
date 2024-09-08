//
//  Transaction+CoreDataClass.swift
//  BudgetBuddy
//
//  Created by Brandon Jones on 9/8/24.
//

import Foundation
import CoreData

@objc(Transaction)
public class Transaction: NSManagedObject {
 
  public override func awakeFromInsert() {
    self.dateCreated = Date()
  }
}


