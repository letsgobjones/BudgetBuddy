//
//  BudgetListView.swift
//  BudgetApp
//
//  Created by Brandon Jones on 9/2/24.
//

import SwiftUI

struct BudgetListView: View {
  let budgetCategoryResults: FetchedResults<BudgetCategory>
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
