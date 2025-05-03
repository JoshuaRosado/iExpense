//
//  iExpenseApp.swift
//  iExpense
//
//  Created by Joshua Rosado Olivencia on 11/13/24.
//
import SwiftData
import SwiftUI


@main
struct iExpenseApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: ExpenseItem.self)
    }
        
}
