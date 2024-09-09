//
//  BudgetListView.swift
//  BudgetBuddy
//
//  Created by Brandon Jones on 9/2/24.
//

import SwiftUI

struct BudgetListView: View {
  let budgetCategoryResults: FetchedResults<BudgetCategory>
  let onDeleteBudgetCategory: (BudgetCategory) -> Void
  let onEditBudgetCategory: (BudgetCategory) -> Void
  
  var body: some View {
    
    List {
      if !budgetCategoryResults.isEmpty {
        
        ForEach(budgetCategoryResults) { budgetCategory in
          NavigationLink(value: budgetCategory) {
            HStack {
              Text(budgetCategory.title ?? "")
              Spacer()
              VStack(alignment: .trailing, spacing: 10) {
                Text(budgetCategory.total, format: .currency(code: "USD"))
                
                HStack {
                Text("\(budgetCategory.overSpent  ? "Overspent" : "Remaining")")
                  Text(budgetCategory.remainingBudgetTotal, format: .currency(code: "USD"))
                }
                .fontWeight(.bold)
                .foregroundStyle(budgetCategory.overSpent ? .red : .green)
              }
            }
            .contentShape(Rectangle())
            .onLongPressGesture {
              onEditBudgetCategory(budgetCategory)
            }
          }
        }.onDelete { indexSet in
            indexSet.map{budgetCategoryResults[$0]}.forEach(onDeleteBudgetCategory)
          }
      }
      else {
        Text("No Budget Categories Exist!")
      }
      
      
    }
    .listStyle(.plain)
    .navigationDestination(for: BudgetCategory.self) { budgetCategory in
      BudgetDetailView(budgetCategory: budgetCategory)
    }
  }
}

