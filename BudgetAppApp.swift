//
//  BudgetAppApp.swift
//  BudgetApp
//
//  Created by Brandon Jones on 8/29/24.
//

import SwiftUI

@main
struct BudgetAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
            .environment(\.managedObjectContext, CoreDataManager.shared.viewContect)
        }
    }
}
