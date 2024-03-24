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
    
    @State var expenses: [Expense]
    @Environment(\.dismiss) var dismiss
    
    let validCategories = ["House", "Food", "Grocery"]
    var body: some View {
            Section {
                Form {
                    TextField("Name", text: $name)
                   
                    Picker("Category", selection: $category) {
                        ForEach(validCategories, id: \.self) {
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
                }
                
                HStack {
                    Button("Cancel", role: .cancel) {
                        dismiss()
                    }
                    Button("Add") {
                        let newExpense = Expense(name: name, amount: amount, category: category)
                        expenses.append(newExpense)
                        dismiss()
                    }
                }
            }
            .navigationTitle("Add new expense")
            .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    AddExpenseView(expenses: [Expense]())
}
