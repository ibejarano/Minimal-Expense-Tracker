//
//  RowExpenseView.swift
//  Minimal Expense Tracker
//
//  Created by Ignacio Bejarano on 26/3/24.
//

import SwiftUI

struct CategoryBadge : View {
    let category: String
    var body: some View {
        Text(category)
            .padding(.horizontal)
            .background(.cyan)
    }
}

struct RowExpenseView: View {
    
    let expense: Expense
    
    var body: some View {
        Label(expense.name, systemImage: "bolt.fill") //  {
            // Text(expense.name).frame(width: 120)
            // Spacer()
            // CategoryBadge(category: expense.category)
            // Spacer()
            // Text(expense.amount, format: .currency(code: "USD"))
            // }
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
            RowExpenseView(expense: Expense.example)
            RowExpenseView(expense: Expense.example)
            RowExpenseView(expense: Expense.example)
        }
    }
}
