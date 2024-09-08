//
//  BudgetBuddyApp.swift
//  BudgetBuddy
//
//  Created by Brandon Jones on 8/29/24.
//

import SwiftUI

@main
struct BudgetBuddyApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
            .environment(\.managedObjectContext, CoreDataManager.shared.viewContect)
        }
    }
}
