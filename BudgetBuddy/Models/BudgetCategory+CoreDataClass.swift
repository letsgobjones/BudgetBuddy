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
  
  var overSpent: Bool {
    remainingBudget < 0
  }
  
  
  var transactionsTotal: Double {
    transactionArray.reduce(0) { result, transaction in
      result + transaction.total
    }
  }
  
  var remainingBudget: Double {
    self.total - transactionsTotal
  }
  
  private var transactionArray: [Transaction] {
guard let transactions = transactions else { return [] }
let allTransactions = (transactions.allObjects as? [Transaction]) ?? []

    return allTransactions.sorted {
      $0.dateCreated! > $1.dateCreated!
    }
  }
      
    
  static func transactionsByCategoryRequest(_ budgetCategory: BudgetCategory) -> NSFetchRequest<Transaction> {
    
    let request = Transaction.fetchRequest()
    request.sortDescriptors = [NSSortDescriptor(key: "dateCreated", ascending: false)]
    request.predicate = NSPredicate(format: "category = %@", budgetCategory)
    return request
  }
}
