import SwiftUI

struct AddPaymentView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(BorrowersStore.self) private var borrowersStore
    @Environment(TransactionsStore.self) private var transactionsStore

    @State private var selectedBorrowerId: Int? = nil
    @State private var amount: String = ""
    @State private var refNumber: String = ""

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Add Payment")
                .font(.title)
                .bold()

            if borrowersStore.borrowers.isEmpty {
                Text("No borrower added yet.")
                    .foregroundStyle(.secondary)
            } else {
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

                TextField("Reference Number (optional)", text: $refNumber)
                    .textFieldStyle(.roundedBorder)

                Button("Save") {
                    let trimmedAmount = amount.trimmingCharacters(in: .whitespacesAndNewlines)
                    guard let borrowerId = selectedBorrowerId ?? borrowersStore.borrowers.first?.id,
                          let value = Double(trimmedAmount), value > 0 else { return }

                    let newId = (transactionsStore.transactions.map { $0.id }.max() ?? 0) + 1
                    let trimmedRef = refNumber.trimmingCharacters(in: .whitespacesAndNewlines)
                    let payment = Payment(id: newId, totalAmount: value, borrowerId: borrowerId, refNumber: trimmedRef.isEmpty ? nil : trimmedRef)
                    transactionsStore.transactions.append(payment)
                    dismiss()
                }
                .buttonStyle(.borderedProminent)
                .tint(.blue)
            }

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
    return AddPaymentView()
        .environment(borrowers)
        .environment(TransactionsStore())
}
