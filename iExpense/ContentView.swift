//
//  ContentView.swift
//  iExpense
//
//  Created by Joshua Rosado Olivencia on 11/13/24.
//

import SwiftUI



struct ExpenseItem: Identifiable, Codable {

    
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
    let currency: String
} 

@Observable
class Personal {

    var personalItems = [ExpenseItem](){
        didSet {
            // ENCODE the Objects created into JSON
            if let encoded = try? JSONEncoder().encode(personalItems) {
                // and Save it using UserDefaults.
                UserDefaults.standard.set(encoded, forKey: "Personal")
            }
        }
    }
     
    init() { // New Initializer
        
        // if savedItems from UserDefaults
        if let savedItems = UserDefaults.standard.data(forKey: "Personal") {
            // Copy the code from savedItems
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
                // The new Object is now The returning Object saved from UserDefault as DECODED
                personalItems = decodedItems
                return
            }
        }
        // if not return an empty array
        
        personalItems = []
    }
}

@Observable
class Business {

    var businessItems = [ExpenseItem](){
        didSet {
            // ENCODE the Objects created into JSON
            if let encoded = try? JSONEncoder().encode(businessItems) {
                // and Save it using UserDefaults.
                UserDefaults.standard.set(encoded, forKey: "Business")
            }
        }
    }
     
    init() { // New Initializer
        
        // if savedItems from UserDefaults
        if let savedItems = UserDefaults.standard.data(forKey: "Business") {
            // Copy the code from savedItems
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
                // The new Object is now The returning Object saved from UserDefault as DECODED
                businessItems = decodedItems
                return
            }
        }
        // if not return an empty array
        
        businessItems = []
    }
}

//
//@Observable
//class Expenses {

//    var items = [ExpenseItem](){
//        didSet {
//            // ENCODE the Objects created into JSON
//            if let encoded = try? JSONEncoder().encode(items) {
//                // and Save it using UserDefaults.
//                UserDefaults.standard.set(encoded, forKey: "Items")
//            }
//        }
//    }
//     
//    init() { // New Initializer
//        
//        // if savedItems from UserDefaults
//        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
//            // Copy the code from savedItems
//            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
//                // The new Object is now The returning Object saved from UserDefault as DECODED
//                items = decodedItems
//                return
//            }
//        }
//        // if not return an empty array
//        
//        items = []
//    }
//}







struct ContentView: View {
//    @State private var expenses = Expenses()
    @State private var business = Business()
    @State private var personal = Personal()
    
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationStack {
            List {
                
                Section{
                    
                    
                    ForEach(personal.personalItems, id: \.id){ item in
                        
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
                    
                    
                    .onDelete(perform: removeItems)
                }
                
                Section{
                    
                    
                    ForEach(business.businessItems, id: \.id){ item in
                        
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
                    
                    
                    .onDelete(perform: removeBusinessItems)
                }
            }
            .navigationTitle("iExpense")
            
            .toolbar {
                EditButton()
                Button("Add Expense", systemImage: "plus"){
                
                
                    
                    showingAddExpense = true
                    
                    
                    
                }
            }
            .sheet(isPresented: $showingAddExpense){
                AddView(business: Business(), personal: Personal())
            }
            
        }
    }
    
    func removeItems(at offsets: IndexSet){
        
        personal.personalItems.remove(atOffsets: offsets)
    }
    func removeBusinessItems(at offsets: IndexSet){
        
        business.businessItems.remove(atOffsets: offsets)
    }
    
}

#Preview {
    ContentView()
}
