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
    var typeOfTransaction: String
    let types = ["Personal", "Business"]
    
    init(typeOfTransaction: String, sortOrder: [SortDescriptor<ExpenseItem>]){
        _expenseItems = Query(sort:sortOrder)
        self.typeOfTransaction = typeOfTransaction
    }
    
    @State private var showingAddExpense = false
    
    var filteredExpenses: [ExpenseItem]{
        if typeOfTransaction == "All"{
            return expenseItems
        } else {
            return expenseItems.filter { $0.type == typeOfTransaction }
        }
    }
    var body: some View {
        List {
            if typeOfTransaction == "All" || typeOfTransaction == "Personal" {
                
                
                Section("Personal Expenses"){
                    
                    ForEach(filteredExpenses.filter{ $0.type == "Personal"}, id: \.id ){ item in
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
            }
            if typeOfTransaction == "All" || typeOfTransaction == "Business"{
                
                Section("Business Expenses"){
                    
                    
                    ForEach(filteredExpenses.filter { $0.type == "Business"}, id: \.id){ item in
                        
                        
                        
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
    }
        
        func removeItems(at offsets: IndexSet){
            personalExpenses.personalItems.remove(atOffsets: offsets)
        }
    
        func removeBusinessItems(at offsets: IndexSet){
            businessExpenses.businessItems.remove(atOffsets: offsets)
            
            
            
        }
        
        
    
//    init(typeOfTransaction: String, sortOrder: [SortDescriptor<ExpenseItem>]) {
//        _expenseItems = Query(filter: #Predicate<ExpenseItem> {
//            expenseItem in
//            expenseItem.type == typeOfTransaction
//        } , sort: sortOrder)
//    }

}

#Preview {
    ExpensesView(typeOfTransaction: "All", sortOrder: [SortDescriptor<ExpenseItem>(\.date)])
        
}
