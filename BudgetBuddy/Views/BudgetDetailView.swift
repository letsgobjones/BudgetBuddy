//
//  BudgetDetailView.swift
//  BudgetBuddy
//
//  Created by Brandon Jones on 9/8/24.
//

import SwiftUI

struct BudgetDetailView: View {
  let budgetCategory: BudgetCategory
  @State private var title: String = ""
  @State private var total: String = ""
  
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
      Form {
        
        Section(header: Text("Add Transaction")) {
          TextField("Title", text: $title)
          TextField("Total", text: $total)
        }
        
        Button("Save Transaction") {
          //save transaction
        }.frame(maxWidth: .infinity, alignment: .center)
      }
      .clipShape(RoundedRectangle(cornerRadius: 10)) 
      Spacer()
    }
    .padding()
  }
  
}

