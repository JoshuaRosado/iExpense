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
            ExpensesView()
            
            
            
                .navigationTitle("iExpense")
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing){
                        EditButton()
                            .padding(.horizontal)
                            .padding(.trailing )
                    }
                    
//                    ToolbarItem(placement: .topBarLeading){
//                        Button(showingRecent ? "Show Everyone" : "Show Upcoming"){
//                            showingRecent.toggle()
//                        }
//                    }
                    ToolbarItem(placement: .topBarTrailing){
                        
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

