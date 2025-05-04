//
//  ContentView.swift
//  iExpense
//
//  Created by Joshua Rosado Olivencia on 11/13/24.
//
import SwiftData
import SwiftUI

struct ContentView: View {
    @State private var sortOrder = [SortDescriptor(\ExpenseItem.amount), SortDescriptor(\ExpenseItem.date),
    ]
    
    
    var body: some View {
        Home()
    }
}
#Preview {
    ContentView()
}
