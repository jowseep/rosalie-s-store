//
//  PaymentDashboard.swift
//  Rosalie's Store
//
//  Created by Joseph Callao on 7/20/25.
//

import SwiftUI

struct PaymentDashboard: View {
    @Environment(TransactionsStore.self) private var transactionsStore
    @State private var showingAddSheet = false

    var body: some View {
        List {
            Section(TransactionType.payment.title) {
                ForEach(transactionsStore.transactions.filter { $0.type == .payment }) { payment in
                    HStack {
                        Text("₱\(String(format: "%.2f", payment.totalAmount))")
                        Spacer()
                        Text(payment.formattedDate)
                            .foregroundStyle(.secondary)
                    }
                }
                Button("Add Payment", systemImage: "plus") {
                    showingAddSheet = true
                }
            }
        }
        .sheet(isPresented: $showingAddSheet) {
            AddPaymentView()
        }
    }
}

#Preview {
    let sampleStore = TransactionsStore(transactions: [
        Transaction(id: 1, totalAmount: 270.0, type: .payment, borrowerId: 1),
        Transaction(id: 2, totalAmount: 310.0, type: .payment, borrowerId: 2),
        Transaction(id: 3, totalAmount: 90.0, type: .debt, borrowerId: 1)
    ])
    return PaymentDashboard()
        .environment(sampleStore)
}
