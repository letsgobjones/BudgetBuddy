//
//  BudgetListView.swift
//  BudgetApp
//
//  Created by Brandon Jones on 9/2/24.
//

import SwiftUI

struct BudgetListView: View {
  let budgetCategoryResults: FetchedResults<BudgetCategory>
  let onDeleteBudgetCategory: (BudgetCategory) -> Void
  
  
  var body: some View {
    
    List {
      if !budgetCategoryResults.isEmpty {
        
          ForEach(budgetCategoryResults) { budgetCategory in
            HStack {
            Text(budgetCategory.title ?? "")
              Spacer()
              VStack {
                Text(budgetCategory.total, format: .currency(code: "USD"))
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
    
    
    
    
  }
}

//#Preview {
//    BudgetListView()
//}
