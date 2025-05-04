//
//  expenseItem.swift
//  iExpense
//
//  Created by Joshua Rosado Olivencia on 5/3/25.
//

import Foundation
import SwiftData
import SwiftUI

@Model

class ExpenseItem {

    
    var id = UUID()
    var name: String
    var type: String
    var amount: Double
    var currency: String
    var date : Date
    
    init (name: String, type: String, amount: Double, currency: String, date: Date) {
        self.name = name
        self.type = type
        self.amount = amount
        self.currency = currency
        self.date = date
    }
    
}
