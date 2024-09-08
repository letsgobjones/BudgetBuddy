//
//  TransactionListView.swift
//  BudgetBuddy
//
//  Created by Brandon Jones on 9/8/24.
//

import SwiftUI
import CoreData

struct TransactionListView: View {
  
  @FetchRequest var transactions: FetchedResults<Transaction>
  
  init(request: NSFetchRequest<Transaction>) {
    _transactions = FetchRequest(fetchRequest: request)
    
  }
  
  
  var body: some View {
    if transactions.isEmpty {
      Text("No Transactions.")
        .frame(maxWidth: .infinity)
        .multilineTextAlignment(.center)
    }
    
    else {
      List {
        ForEach(transactions) { transaction in
          HStack {
            Text(transaction.title ?? "")
            Spacer()
            Text(transaction.total, format: .currency(code: "USD"))
          }
          
        }
      }
      .clipShape(RoundedRectangle(cornerRadius: 10))
      
    }
  }
}

