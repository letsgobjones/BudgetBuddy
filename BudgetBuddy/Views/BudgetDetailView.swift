//
//  BudgetDetailView.swift
//  BudgetBuddy
//
//  Created by Brandon Jones on 9/8/24.
//

import SwiftUI
import CoreData

struct BudgetDetailView: View {
  @Environment(\.managedObjectContext) private var viewContext
  let budgetCategory: BudgetCategory
  @State private var title: String = ""
  @State private var total: String = ""
  
  var isFormValid: Bool {
    guard let totalAsDouble = Double(total) else { return false }
    return !title.isEmpty && !total.isEmpty && totalAsDouble > 0
  }
  
  var body: some View {
    VStack(alignment: .leading) {
      HStack {
        VStack(alignment: .leading) {
          Text(budgetCategory.title ?? "")
            .font(.largeTitle)
          HStack {
            Text("Budget")
            Text(budgetCategory.total, format: .currency(code: "USD"))
          }
          .frame(maxWidth: .infinity)
          .fontWeight(.bold)
        }
        
      }
      Form {
        
        Section(header: Text("Add Transaction")) {
          TextField("Title", text: $title)
          TextField("Total", text: $total)
        }
        
        Button("Save Transaction") {
          //save transaction
          saveTransaction()
          title = ""
          total = ""
        }
        .disabled(!isFormValid)
        .frame(maxWidth: .infinity, alignment: .center)
      }
      .clipShape(RoundedRectangle(cornerRadius: 10))
      
      
      //Display summary of budget category
BudgetSummaryView(budgetCategory: budgetCategory)
      
      TransactionListView(request: BudgetCategory.transactionsByCategoryRequest( budgetCategory))
      
      Spacer()
    }
    .padding()
  }
  
}

extension BudgetDetailView {
  private func saveTransaction() {
    do {
      let transaction = Transaction(context: viewContext)
      transaction.title = title
      transaction.total = Double(total)!
      
      budgetCategory.addToTransactions(transaction)
      try viewContext.save()
    } catch {
      print(error)
    }
  }
}
