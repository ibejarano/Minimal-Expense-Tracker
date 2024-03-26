//
//  ContentView.swift
//  Minimal Expense Tracker
//
//  Created by Ignacio Bejarano on 15/3/24.
//

import SwiftUI

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

struct ExpenseListView: View {
    @Binding var expenses: [Expense]
    
    var body: some View {
        List {
            ForEach(expenses) { expense in
                HStack {
                    Text(expense.name).frame(width: 120)
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
    
    @State private var addNewExpense = false
    var body: some View {
        NavigationStack {
            ExpenseListView(expenses: $expenses).navigationTitle("Today's expenses")
                .toolbar {
                    Button("Dummy Add") {
                        let newexp = Expense(name: "Gas", amount: Double.random(in: 1...100), category: "House")
                        expenses.append(newexp)
                    }
                    EditButton()
                }
                .sheet(isPresented: $addNewExpense) {
                    AddExpenseView(expenses: expenses)
                }
        }
    }
}

#Preview {
    ContentView()
}
