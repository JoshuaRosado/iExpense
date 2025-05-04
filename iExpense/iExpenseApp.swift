//
//  iExpenseApp.swift
//  iExpense
//
//  Created by Joshua Rosado Olivencia on 11/13/24.
//
import SwiftData
import SwiftUI

 // Challenge 1 (Day-59)
// Upgrade to SwiftData
@main
struct iExpenseApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: ExpenseItem.self)
    }
        
}
