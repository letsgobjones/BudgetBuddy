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
  let onDeleteTransaction: (Transaction) -> Void
  
  init(request: NSFetchRequest<Transaction>, onDeleteTransation:  @escaping (Transaction) -> Void) {
    _transactions = FetchRequest(fetchRequest: request)
    self.onDeleteTransaction = onDeleteTransation
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
          
        }.onDelete { offsets in
          offsets.map {  transactions[$0] }.forEach(onDeleteTransaction)
        }
      }
      .clipShape(RoundedRectangle(cornerRadius: 10))
    }
  }
}

