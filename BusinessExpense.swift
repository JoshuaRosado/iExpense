//
//  BusinessExpense.swift
//  iExpense
//
//  Created by Joshua Rosado Olivencia on 5/3/25.
//

import Foundation
import SwiftData
import SwiftUI

@Model

class BusinessExpenses {
    var businessItems = [ExpenseItem]()
    
    init(businessItems: [ExpenseItem] = [ExpenseItem]()) {
        self.businessItems = businessItems
    }
}
