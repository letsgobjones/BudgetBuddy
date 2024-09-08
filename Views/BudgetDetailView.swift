//
//  BudgetDetailView.swift
//  BudgetApp
//
//  Created by Brandon Jones on 9/8/24.
//

import SwiftUI

struct BudgetDetailView: View {
  let budgetCategory: BudgetCategory
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
          .fontWeight(.bold)
        }
        
      }
      Spacer()
    }
  }
}

