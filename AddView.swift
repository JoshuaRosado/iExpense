//
//  AddView.swift
//  iExpense
//
//  Created by Joshua Rosado Olivencia on 11/17/24.
//

import SwiftUI

struct AddView: View {
    @Environment(\.dismiss) var dismiss // add a dismiss action
    
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = 0.0
    @State private var currency = "USD"
    
//    var expenses : Expenses
    
    var business : Business
    var personal : Personal
    
    let currencies = ["AED", "AUD", "BZD", "DKK", "EUR", "GBP", "JPY", "KES", "MXN", "OMR", "STD", "USD", "XCD", "ZWD"]
    let types = ["Business", "Personal"]
    var body: some View {
        NavigationStack {
            Form {
                TextField("Name", text: $name)
                
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
            .navigationTitle("Add new expense")
            .toolbar{
                Button("Save") {
                    let item = ExpenseItem(name: name, type: type, amount: amount, currency: currency)
                    if item.type == "Personal"{
                       personal.personalItems.append(item)
                        print(personal.personalItems)
                    }
                    else if item.type == "Business"{
                        business.businessItems.append(item)
                    }
                    
                    dismiss() // dismiss sheet when Save btn is selected
                }
            }
        }
    }
}

#Preview {
    AddView(business: Business(), personal: Personal())
}
