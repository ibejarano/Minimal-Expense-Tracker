//
//  ExpenseListview.swift
//  Minimal Expense Tracker
//
//  Created by Ignacio Bejarano on 26/3/24.
//

import SwiftUI

struct ExpenseListview: View {
    @Binding var expenses: [Expense]
    
    var body: some View {
        List {
            ForEach(expenses) { expense in
                RowExpenseView(expense: expense)
            }.onDelete(perform: { indexSet in
                expenses.remove(atOffsets: indexSet)
            })
        }
    }
}


#Preview("Example array") {
    @State var exampleArray : [Expense] = Expense.exampleArray
    
    return ExpenseListview(expenses: $exampleArray)
}
