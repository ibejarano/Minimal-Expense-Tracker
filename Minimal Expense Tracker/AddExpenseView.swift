//
//  AddExpenseView.swift
//  Minimal Expense Tracker
//
//  Created by Ignacio Bejarano on 24/3/24.
//

import SwiftUI

struct AddExpenseView: View {
    
    @State private var name = ""
    @State private var category = ""
    @State private var amount = Double.random(in: 1...100)
    
    @Binding var expenses: [Expense]
    let expenseCategories: [String]
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
                List {
                    TextField("Name", text: $name)
                   
                    Picker("Category", selection: $category) {
                        ForEach(expenseCategories, id: \.self) {
                            Text($0)
                        }
                    }
                    
                    HStack {
                        Text("Amount")
                        Spacer()
                        Text("$")
                        Spacer()
                        TextField("Amount", value: $amount, formatter: NumberFormatter()).frame(alignment: .trailing)
                    }
                    HStack {
                        Button("Cancel", role: .cancel) {
                            dismiss()
                        }
                        Spacer()
                        Button("Add") {
                            let newExpense = Expense(name: name, amount: amount, category: category)
                            expenses.append(newExpense)
                            dismiss()
                        }.buttonStyle(.borderedProminent)
                    }
                }.presentationDetents([.medium, .large])
    }
}

#Preview("Normal") {
    
    @State var user = User(name: "Ignacio")
    @State var expenses = Expense.exampleArray
    
    return AddExpenseView(expenses: $expenses, expenseCategories: user.expensesCategories.categories)
}

#Preview("Sheet") {
    
    @State var user = User(name: "Ignacio")
    @State var expenses = Expense.exampleArray
    @State var showSheet = true
    
    return
        Text("Background view")
        .sheet(isPresented: $showSheet){
            AddExpenseView(expenses: $expenses, expenseCategories: user.expensesCategories.categories)
        }
}
