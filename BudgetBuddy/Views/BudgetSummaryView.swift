//
//  BudgetSummaryView.swift
//  BudgetBuddy
//
//  Created by Brandon Jones on 9/8/24.
//

import SwiftUI

struct BudgetSummaryView: View {
  
  @ObservedObject var budgetCategory: BudgetCategory
  
    var body: some View {
      HStack {

          Text("\(budgetCategory.overSpent  ? "Overspent" : "Remaining")")
          Text(budgetCategory.remainingBudgetTotal, format: .currency(code: "USD"))
          .fontWeight(.bold)
          .foregroundStyle(budgetCategory.overSpent ? .red : .green)
         
      }
      .frame(maxWidth: .infinity)
    }
}

