//
//  BorrowerDashboard.swift
//  Rosalie's Store
//
//  Created by Joseph Callao on 7/20/25.
//

import SwiftUI

struct BorrowerDashboard: View {
    @Environment(BorrowersStore.self) private var borrowersStore
    @Environment(TransactionsStore.self) private var transactionsStore
    var borrowerId: Int
    @State private var showAddDebt = false

    private var borrower: Borrower? {
        borrowersStore.borrowers.first { $0.id == borrowerId }
    }

    private var debts: [Transaction] {
        transactionsStore.transactions.filter { $0.type == .debt && $0.borrowerId == borrowerId }
    }

    private var payments: [Transaction] {
        transactionsStore.transactions.filter { $0.type == .payment && $0.borrowerId == borrowerId }
    }

    private var currentDebt: Double {
        debts.reduce(0) { $0 + $1.totalAmount }
    }

    var body: some View {
        List {
            VStack {
                Image(systemName: "person.crop.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80)
                    .foregroundStyle(.blue)
                    .padding(.bottom, 4)

                Text(borrower?.fullName ?? "Unknown")
                    .font(.title.bold())
                Text("Current debt: ₱\(String(format: "%.2f", currentDebt))")
                    .foregroundStyle(.secondary)
            }
            .frame(maxWidth: .infinity, alignment: .center)
            .listRowBackground(Color.clear)
            .listRowInsets(EdgeInsets())

            Section(TransactionType.debt.title) {
                ForEach(debts) { debt in
                    HStack {
                        Text("₱\(String(format: "%.2f", debt.totalAmount))")
                        Spacer()
                        Text(debt.formattedDate)
                            .foregroundStyle(.secondary)
                    }
                }
                Button("Add Debt", systemImage: "plus") {
                    showAddDebt = true
                }
                .sheet(isPresented: $showAddDebt) {
                    AddDebtView(initialBorrowerId: borrowerId)
                }
            }

            Section(TransactionType.payment.title) {
                ForEach(payments) { payment in
                    HStack {
                        Text("₱\(String(format: "%.2f", payment.totalAmount))")
                        Spacer()
                        Text(payment.formattedDate)
                            .foregroundStyle(.secondary)
                    }
                }
                Button("Add Payment", systemImage: "plus") {
                    print("Adding payment")
                }
            }
        }
    }
}

#Preview {
    let borrowerStore = BorrowersStore(borrowers: [
        Borrower(id: 1, firstName: "Juan", lastName: "Dela Cruz")
    ])
    let transactionStore = TransactionsStore(transactions: [
        Debt(id: 1, totalAmount: 90, borrowerId: 1, notes: "Sabon, Shampoo"),
        Debt(id: 2, totalAmount: 55, borrowerId: 1, notes: "Del, Ariel"),
        Payment(id: 3, totalAmount: 270, borrowerId: 1, refNumber: "RS1001")
    ])
    return BorrowerDashboard(borrowerId: 1)
        .environment(borrowerStore)
        .environment(transactionStore)
}

