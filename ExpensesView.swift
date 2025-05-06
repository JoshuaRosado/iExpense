//
//  ExpensesView.swift
//  iExpense
//
//  Created by Joshua Rosado Olivencia on 5/5/25.
//
import SwiftData
import SwiftUI


struct ExpensesView: View {
    // Load all ExpenseItems
    @Query var expenseItems: [ExpenseItem]

    
    @State private var personalExpenses = PersonalExpenses()
    @State private var businessExpenses = BusinessExpenses()
    @State private var totalExpenses = 0
    @State private var totalBusiness = 0
    @State private var totalPersonal = 0
    
    let types = ["Personal", "Business"]
    
    @State private var showingAddExpense = false
    
    var body: some View {
        List {
            Section("Personal Expenses"){
                
                ForEach(personalExpenses.personalItems, id: \.id){ item in
                    if item.type == "Personal"{
                        
                        HStack{
                            VStack(alignment: .leading){
                                Text(item.name)
                                    .font(.headline)
                                
                                Text(item.type)
                            }
                            
                            Spacer()
                            
                            Text(item.amount, format:.currency(code:item.currency))
                                .foregroundStyle(item.amount < 10 ? .yellow : item.amount < 100 ? .orange : item.amount >= 100 ? .red : .black)
                        }
                    }
                }
                .onDelete(perform: removeItems)
            }
            .padding(.vertical)
            
            Section("Business Expenses"){
                
                
                ForEach(businessExpenses.businessItems, id: \.id){ item in
                    
                    
                    
                    HStack{
                        VStack(alignment: .leading){
                            Text(item.name)
                                .font(.headline)
                            
                            Text(item.type)
                        }
                        
                        Spacer()
                        
                        
                        Text(item.amount, format:.currency(code:item.currency))
                            .foregroundStyle(item.amount < 10 ? .yellow : item.amount < 100 ? .orange : item.amount >= 100 ? .red : .black)
                        
                    }
                    .padding(.vertical)
                }
                .onDelete(perform: removeBusinessItems)
                
            }
            
            
            
        }
    }
        
        func removeItems(at offsets: IndexSet){
            personalExpenses.personalItems.remove(atOffsets: offsets)
        }
        
        func removeBusinessItems(at offsets: IndexSet){
            businessExpenses.businessItems.remove(atOffsets: offsets)
            
            
            
        }
        
        
    
    init(transactionDate: Date, sortOrder: [SortDescriptor<ExpenseItem>]) {
        _expenseItems = Query(filter: #Predicate<ExpenseItem> {
            expenseItem in
            expenseItem.date >= transactionDate
        } , sort: sortOrder)
    }

}

#Preview {
    ExpensesView(transactionDate: .now, sortOrder: [SortDescriptor(\ExpenseItem.name)])
        .modelContainer(for:ExpenseItem.self)
}
