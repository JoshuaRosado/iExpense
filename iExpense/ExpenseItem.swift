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
    
    init(id: UUID = UUID(), name: String, type: String, amount: Double, currency: String) {
        self.id = id
        self.name = name
        self.type = type
        self.amount = amount
        self.currency = currency
    }
    
}
