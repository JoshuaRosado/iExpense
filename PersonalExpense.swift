//
//  PersonalExpense.swift
//  iExpense
//
//  Created by Joshua Rosado Olivencia on 5/3/25.
//

import Foundation
import SwiftData
import SwiftUI

@Model

class PersonalExpenses {
    var personalItems = [ExpenseItem]()
    
    init(personalItems: [ExpenseItem] = [ExpenseItem]()) {
        self.personalItems = personalItems
    }
    
}
