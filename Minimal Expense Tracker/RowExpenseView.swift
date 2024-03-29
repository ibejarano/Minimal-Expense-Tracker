//
//  RowExpenseView.swift
//  Minimal Expense Tracker
//
//  Created by Ignacio Bejarano on 26/3/24.
//

import SwiftUI

struct RowExpenseView: View {
    
    let expense: Expense
    
    var body: some View {
        Label {
            HStack {
                Text(expense.name)
                Spacer()
                Text(expense.amount, format: .currency(code: "USD"))
            }
        } icon: {
            Image(systemName: expense.icon)
            
        }
    }
}

#Preview("Single View") {
    RowExpenseView(expense: Expense.example)
}

#Preview("List VStack View") {
    return List {
        Section {
            RowExpenseView(expense: Expense.example)
            RowExpenseView(expense: Expense.example)
            RowExpenseView(expense: Expense.example)
            RowExpenseView(expense: Expense.example)
        }
        Section {
            ForEach(Expense.exampleArray) {
                RowExpenseView(expense: $0)
            }
        }
    }
}
