//
//  ContentView.swift
//  Minimal Expense Tracker
//
//  Created by Ignacio Bejarano on 15/3/24.
//

import SwiftUI




struct ContentView: View {
    @State private var expenses: [Expense] = Expense.exampleArray
    @State private var user = User(name: "Ignacio")
    
    @State private var addNewExpense = false
    var body: some View {
        NavigationStack {
            ExpenseListview(expenses: $expenses).navigationTitle("Today's expenses")
                .toolbar {
                    
                    
                    Button("Add", systemImage: "plus.circle.fill") {
                        addNewExpense = true
                    }
                    
                    EditButton()
                    
                }
                .sheet(isPresented: $addNewExpense) {
                    AddExpenseView(expenses: $expenses, expenseCategories: user.expensesCategories.categories)
                }
        }
    }
}

#Preview {
    ContentView()
}
