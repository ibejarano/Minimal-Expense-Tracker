//
//  Expense.swift
//  Minimal Expense Tracker
//
//  Created by Ignacio Bejarano on 26/3/24.
//

import Foundation


class ExpenseCategory {
    
    var categories = ["General", "Food", "House", "Transportation"]
    
    init(categories: [String] = ["General", "Food", "House", "Transportation"]) {
        self.categories = categories
    }
    
    func add(newCategory: String) {
        self.categories.append(newCategory)
    }
    
    // TODO : Subcategories for each category
}

@Observable
class Expense: Identifiable {
    let id = UUID()
    let name: String
    let amount: Double
    let category: String
    
    init(name: String, amount: Double, category: String) {
        self.name = name
        self.amount = amount
        self.category = category
    }
    
    static var example = Expense(name: "Bananas", amount: Double.random(in: 1...100), category: "Grocery")
    
    static var exampleArray : [Expense] = [
        Expense(name: "Bananas", amount: Double.random(in: 1...100), category: "Grocery"),
        Expense(name: "Meat with salad", amount: Double.random(in: 1...100), category: "Food"),
        Expense(name: "Aspirines", amount: Double.random(in: 1...100), category: "Health"),
        Expense(name: "Rent", amount: Double.random(in: 1...100), category: "House"),
        Expense(name: "Water supply", amount: Double.random(in: 1...100), category: "House"),
        Expense(name: "Gas", amount: Double.random(in: 1...100), category: "House")
    ]
}
