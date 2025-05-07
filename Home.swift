//
//  Home.swift
//  iExpense
//
//  Created by Joshua Rosado Olivencia on 5/4/25.
//

import SwiftData
import SwiftUI

struct Home: View {
    
    @State private var personalExpenses = PersonalExpenses()
    @State private var businessExpenses = BusinessExpenses()
    @State private var sortOrder = [SortDescriptor(\ExpenseItem.amount), SortDescriptor(\ExpenseItem.date),
    ]
    @State private var showingRecent = false
    
    var body: some View {
        NavigationStack {
            
            // Passing sortOrder for Sort By button
            ExpensesView(sortOrder: sortOrder)
            // Wrapping view with
                .id(sortOrder)
            // So when Sort By is updated, the view will update in real time every single time
                
            
            
            
                .navigationTitle("iExpense")
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing){
                        EditButton()
                            .padding(.horizontal)
                            .padding(.trailing )
                    }
                    

                    ToolbarItem(placement: .topBarTrailing){
                        // Sort by Button
                        // Wrapped in Menu to have both options when Picker is tapped
                        Menu("Sort", systemImage: "arrow.up.arrow.down"){
                            Picker("Sort", selection: $sortOrder){
                                Text("Sort by Amount")
                                    .tag([
                                        SortDescriptor(\ExpenseItem.amount)
                                    ])
                                
                                Text("Sort by Date")
                                    .tag([
                                        SortDescriptor(\ExpenseItem.date)
                                    ])
                            }
                        }
                    }
                    
                    
                    
                    
                    // CHALLENGE 1
                    // REPLACE .sheet for NavigationLink
                    ToolbarItem(placement: .bottomBar){
                        NavigationLink{
                            
                            AddView()
                                .navigationBarBackButtonHidden()
                        } label: {
                            Image(systemName: "plus")
                        }
                        .padding(.trailing)
                    }
                }
        }
    }
    
}


#Preview {
    Home()
}

