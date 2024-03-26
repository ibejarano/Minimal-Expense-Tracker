//
//  ContentView.swift
//  Minimal Expense Tracker
//
//  Created by Ignacio Bejarano on 15/3/24.
//

import SwiftUI


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
    @State private var user = User(name: "Ignacio")
    
    @State private var addNewExpense = false
    var body: some View {
        NavigationStack {
            ExpenseListView(expenses: $expenses).navigationTitle("Today's expenses")
                .toolbar {
                    Button("Dummy Add") {
                        let newexp = Expense(name: "Gas", amount: Double.random(in: 1...100), category: "House")
                        expenses.append(newexp)
                    }
                    
                    Button("Add", systemImage: "plus.circle.fill") {
                        addNewExpense = true
                    }
                    
                    EditButton()
                }
                .sheet(isPresented: $addNewExpense) {
                    AddExpenseView(expenses: $expenses)
                }
        }
    }
}

#Preview {
    ContentView()
}
