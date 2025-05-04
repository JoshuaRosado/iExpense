//
//  AddView.swift
//  iExpense
//
//  Created by Joshua Rosado Olivencia on 11/17/24.
//

import SwiftUI

struct AddView: View {
    @Environment(\.dismiss) var dismiss // add a dismiss action
    
    @State private var name = "Edit Name"
    @State private var type = "Personal"
    @State private var amount = 0.0
    @State private var currency = "USD"
    
    
    var personalExpenses : PersonalExpenses
    var businessExpenses: BusinessExpenses
    
    
    
    let currencies = ["AED", "AUD", "BZD", "DKK", "EUR", "GBP", "JPY", "KES", "MXN", "OMR", "STD", "USD", "XCD", "ZWD"]
    let types = ["Business", "Personal"]
    var body: some View {
        NavigationStack {
            Form {
                
                Picker("Type", selection: $type) {
                    ForEach(types, id: \.self){
                        Text($0)
                    }
                }
                HStack{
                    
                    TextField("Amount", value: $amount, format: .currency(code: currency))
                        .keyboardType(.decimalPad)
                    
                    Spacer()
                    
                    Picker("", selection: $currency) {
                        ForEach(currencies, id: \.self){
                            Text($0)
                        }
                    }
                    
                }
                
            }
            
            // CHALLENGE 2
            // Let users edit their issue name in the nav title rather than a separate textfield.
            
            .navigationTitle($name)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                
                // CHALLENGE 1
                // Hide navigationBar back btn and add a Cancel Btn
                
                
                ToolbarItem(placement: .topBarLeading){
                    Button("Cancel"){
                        dismiss()
                    }
                }
                ToolbarItem(placement: .topBarTrailing){
                    let item = ExpenseItem(name: name, type: type, amount: amount, currency: currency, date: .now)
                    if item.type == "Personal"{
                        
                        
                        Button("Save") {
                            
                            
                            personalExpenses.personalItems.append(item)
                            dismiss() // dismiss sheet when Save btn is selected
                        }
                        
                    } else if item.type == "Business"{
                        
                        
                        Button("Save") {
                            
                            
                            businessExpenses.businessItems.append(item)
                            dismiss() // dismiss sheet when Save btn is selected
                        }
                        
                    }
                }
            }
        }
    }
}
#Preview {
    ContentView()
}
