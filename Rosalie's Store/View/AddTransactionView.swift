import SwiftUI

struct AddTransactionView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(BorrowersStore.self) private var borrowersStore
    @Environment(TransactionsStore.self) private var transactionsStore

    @State private var selectedType: TransactionType = .debt
    @State private var selectedBorrowerId: Int? = nil
    @State private var amount: String = ""
    @State private var notes: String = ""

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Add Transaction")
                .font(.title)
                .bold()

            Picker("Type", selection: $selectedType) {
                ForEach(TransactionType.allCases) { type in
                    Text(type.title).tag(type)
                }
            }
            .pickerStyle(.segmented)

            Picker("Borrower", selection: Binding(
                get: { selectedBorrowerId ?? borrowersStore.borrowers.first?.id },
                set: { selectedBorrowerId = $0 }
            )) {
                ForEach(borrowersStore.borrowers) { borrower in
                    Text(borrower.fullName).tag(Optional(borrower.id))
                }
            }
            .pickerStyle(.menu)

            TextField("Amount", text: $amount)
                .keyboardType(.decimalPad)
                .textFieldStyle(.roundedBorder)

            TextField("Notes (optional)", text: $notes)
                .textFieldStyle(.roundedBorder)

            Button("Save") {
                let trimmedAmount = amount.trimmingCharacters(in: .whitespacesAndNewlines)
                guard let borrowerId = selectedBorrowerId ?? borrowersStore.borrowers.first?.id,
                      let value = Double(trimmedAmount), value > 0 else { return }

                let newId = (transactionsStore.transactions.map { $0.id }.max() ?? 0) + 1
                let transaction = Transaction(id: newId, totalAmount: value, type: selectedType, borrowerId: borrowerId)
                transactionsStore.transactions.append(transaction)
                dismiss()
            }
            .buttonStyle(.borderedProminent)
            .tint(.blue)
            .disabled(borrowersStore.borrowers.isEmpty)

            Spacer()
        }
        .padding()
        .onAppear {
            if selectedBorrowerId == nil {
                selectedBorrowerId = borrowersStore.borrowers.first?.id
            }
        }
    }
}

#Preview {
    let borrowers = BorrowersStore(borrowers: [
        Borrower(id: 1, firstName: "Juan", lastName: "Dela Cruz"),
        Borrower(id: 2, firstName: "Maria", lastName: "Santos")
    ])
    return AddTransactionView()
        .environment(borrowers)
        .environment(TransactionsStore())
}
