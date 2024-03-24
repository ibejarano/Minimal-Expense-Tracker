//
//  ContentView.swift
//  Minimal Expense Tracker
//
//  Created by Ignacio Bejarano on 15/3/24.
//

import SwiftUI

struct Expense: Identifiable {
    let id = UUID()
    let name: String
    let amount: Double
    let category: String
    
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

struct ExpenseListView: View {
    @State var expenses: [Expense]
    
    var body: some View {
        List {
            ForEach(expenses) { expense in
                HStack {
                    Text(expense.name)
                    Spacer()
                    Text(expense.category).background(.gray)
                    Spacer()
                    Text(expense.amount, format: .currency(code: "USD"))
                }
            }.onDelete(perform: { indexSet in
                expenses.remove(atOffsets: indexSet)
            })
        }
    }
}

struct ContentView: View {
    @State private var expenses: [Expense] = Expense.exampleArray
    
    var body: some View {
        ExpenseListView(expenses: expenses)
    }
}

#Preview {
    ContentView()
}
