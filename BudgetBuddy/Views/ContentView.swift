//
//  ContentView.swift
//  BudgetBuddy
//
//  Created by Brandon Jones on 8/29/24.
//

import SwiftUI

struct ContentView: View {
  @Environment(\.managedObjectContext) private var viewContext
  @FetchRequest(fetchRequest: BudgetCategory.all) var budgetCategoryResults
  @State private var isPresented: Bool = false
  @State private var sheetAction: SheetAction?
  
  var totalBudget: Double {
    budgetCategoryResults.reduce(0) { results, budgetCategory in
      return results + budgetCategory.total
    }
  }
  var body: some View {
    
    NavigationStack {
      HStack  {
        Text("Total Budget")
        Text(totalBudget, format: .currency(code: "USD"))
          .fontWeight(.bold)
      }
      .padding()
      
      VStack {
        BudgetListView(budgetCategoryResults: budgetCategoryResults, onDeleteBudgetCategory: deleteBudgetCategory, onEditBudgetCategory: editBudgetCategory)
      }
      .sheet(item: $sheetAction, content: { sheetAction in
        //disply the sheet
        switch sheetAction {
        case .add:
          AddBudgetCategoryView()
        case .edit(let budgetCategory):
          AddBudgetCategoryView(budgetCategory: budgetCategory)
        }
      })
      .toolbar {
        ToolbarItem(placement: .topBarTrailing) {
          Button("Add Category") {
            sheetAction = .add
          }
        }
      }
//      .padding()
    }
  }
}


#Preview {
  ContentView().environment(\.managedObjectContext, CoreDataManager.shared.viewContect)
}


extension ContentView {
  private func deleteBudgetCategory(budgetCategory: BudgetCategory) {
    viewContext.delete(budgetCategory)
    do {
      try viewContext.save()
    } catch {
      print(error)
    }
  }
  
  private func editBudgetCategory(budgetCategory: BudgetCategory) {
    sheetAction = .edit(budgetCategory)
  }
  
}


enum SheetAction: Identifiable {
  case add
  case edit(BudgetCategory)
  
  var id: Int {
    switch self {
    case .add:
      return 1
      
    case .edit(_):
      return 2
    }
  }
}
