//
//  DebtDashboard.swift
//  Rosalie's Store
//
//  Created by Joseph Callao on 7/20/25.
//

import SwiftUI

struct DebtDashboard: View {
    @Environment(TransactionsStore.self) private var transactionsStore
    @State private var showingAddSheet = false

    var body: some View {
        List {
            Section(TransactionType.debt.title) {
                ForEach(transactionsStore.transactions.filter { $0.type == .debt }) { debt in
                    HStack {
                        Text("₱\(String(format: "%.2f", debt.totalAmount))")
                        Spacer()
                        Text(debt.formattedDate)
                            .foregroundStyle(.secondary)
                    }
                }
                Button("Add Debt", systemImage: "plus") {
                    showingAddSheet = true
                }
            }
        }
        .sheet(isPresented: $showingAddSheet) {
            AddDebtView()
        }
    }
}

#Preview {
    let sampleStore = TransactionsStore(transactions: [
        Transaction(id: 1, totalAmount: 90.0, type: .debt, borrowerId: 1),
        Transaction(id: 2, totalAmount: 55.0, type: .debt, borrowerId: 2),
        Transaction(id: 3, totalAmount: 120.0, type: .payment, borrowerId: 1)
    ])
    return DebtDashboard()
        .environment(sampleStore)
}
