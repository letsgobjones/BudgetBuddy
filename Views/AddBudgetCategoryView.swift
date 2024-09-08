//
//  AddBudgetCategoryView.swift
//  BudgetApp
//
//  Created by Brandon Jones on 9/2/24.
//

import SwiftUI

struct AddBudgetCategoryView: View {
  @State private var title: String = ""
  @State private var total: Double = 250
  @State private var messages: [String] = []
  @Environment(\.dismiss) private var dismiss
  
  @Environment(\.managedObjectContext) private var viewContext
  
  var isFormValid: Bool {
    messages.removeAll()
    
    if title.isEmpty {
      messages.append("Title is required")
    }
    
    if total <= 0 {
      messages.append("Total should be greater than 1")
    }
    return messages.count == 0
  }
  
  var body: some View {
    NavigationStack {
      Form {
        TextField("Title", text: $title)
        Slider(value: $total, in: 0...500, step: 25) {
          Text("Total")
        } minimumValueLabel: {
          Text("$0")
        } maximumValueLabel: {
          Text("$500")
        }
//        Text(total as NSNumber , formatter: NumberFormatter.currency)
        Text(total , format: .currency(code: "USD"))
          .frame(maxWidth: .infinity, alignment: .center)
        
        ForEach(messages, id: \.self) { message in
          Text(message)
        }
        
        
      }.toolbar{
        
        ToolbarItem(placement: .topBarLeading) {
          Button("Cancel") {
            dismiss()
          }
        }
        
          ToolbarItem(placement: .topBarTrailing) {
            Button("Save") {
              if isFormValid {
                saveBudgetCategory()
                dismiss()
              }
            }
          }
      }
    }
  }
}

#Preview {
  AddBudgetCategoryView()
}



extension AddBudgetCategoryView {
  private func saveBudgetCategory() {
    let budgetCategory = BudgetCategory(context: viewContext)
    budgetCategory.title = title
    budgetCategory.total = total
    //save the context
    do {
      try viewContext.save()
    } catch {
      print(error.localizedDescription)
    }
  }
}

