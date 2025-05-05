//
//  Home.swift
//  iExpense
//
//  Created by Joshua Rosado Olivencia on 5/4/25.
//

import SwiftData
import SwiftUI

struct Home: View {
    
    
    var body: some View {
        NavigationStack {
            Home()
            
            
            
            .navigationTitle("iExpense")
            .toolbar {
                
                ToolbarItem(placement: .secondaryAction){
                    EditButton()
                        .padding(.horizontal)
                        .padding(.trailing )
                    Menu("Sort", systemImage: "arrow.up.arrow.down")
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
                ToolbarItem(placement: .trailing){
                    NavigationLink{
                        
                        AddView(personalExpenses: personalExpenses, businessExpenses: businessExpenses)
                            .navigationBarBackButtonHidden()
                    } label: {
                        Image(systemName: "plus")
                    }
                    .padding(.trailing)
                    
                }
            }
            
        }
        
    }
    
    func removeItems(at offsets: IndexSet){
        personalExpenses.personalItems.remove(atOffsets: offsets)
    }
    
    func removeBusinessItems(at offsets: IndexSet){
        businessExpenses.businessItems.remove(atOffsets: offsets)
        
        
        
    }
}


#Preview {
    Home()
}

