//
//  TestingView.swift
//  Minimal Expense Tracker
//
//  Created by Ignacio Bejarano on 29/3/24.
//

import SwiftUI

struct TestingView: View {
    @State private var showSheet = false
    
    var body: some View {
        Button("Present") {
            showSheet.toggle()
        }.sheet(isPresented: $showSheet) {
            Text("We are doing our best")
                .presentationDetents([.medium, .large])
        }
    }
}

#Preview {
    TestingView()
}
