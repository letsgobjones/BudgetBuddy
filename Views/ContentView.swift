//
//  ContentView.swift
//  BudgetApp
//
//  Created by Brandon Jones on 8/29/24.
//

import SwiftUI

struct ContentView: View {
  @Environment(\.managedObjectContext) private var viewContext
  @FetchRequest(sortDescriptors: []) private var budgetCategoryResults: FetchedResults<BudgetCategory>
  @State private var isPresented: Bool = false
  
  var totalBudget: Double {
    budgetCategoryResults.reduce(0) { results, budgetCategory in
      return results + budgetCategory.total
    }
  }
  var body: some View {
    
    NavigationStack {
      Text(totalBudget, format: .currency(code: "USD"))
        .fontWeight(.bold)
      VStack {
        BudgetListView(budgetCategoryResults: budgetCategoryResults, onDeleteBudgetCategory: deleteBudgetCategory)
      }
      .sheet(isPresented: $isPresented, content: {
        AddBudgetCategoryView()
      })
      .toolbar {
        ToolbarItem(placement: .topBarTrailing) {
          Button("Add Category") {
            isPresented = true
          }
        }
      }
      .padding()
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
}
