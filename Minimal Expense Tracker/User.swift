//
//  User.swift
//  Minimal Expense Tracker
//
//  Created by Ignacio Bejarano on 26/3/24.
//

import Foundation


class User {
    let name: String
    let expensesCategories : ExpenseCategory
    init(name: String) {
        self.name = name
        self.expensesCategories = ExpenseCategory()
    }
    
}
