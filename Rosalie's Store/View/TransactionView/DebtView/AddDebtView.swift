import SwiftUI

struct AddDebtView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(BorrowersStore.self) private var borrowersStore
    @Environment(TransactionsStore.self) private var transactionsStore
    @Environment(ProductsStore.self) private var productsStore

    @State private var selectedBorrowerId: Int? = nil
    @State private var showBorrowerPicker = false
    @State private var showProductsPicker = false
    @State private var quantities: [Int: Int] = [:]
    @State private var notes: String = ""

    private var computedTotal: Double {
        productsStore.products.reduce(0.0) { total, product in
            guard let price = product.price,
                  let qty = quantities[product.id], qty > 0 else { return total }
            let subtotal = price * Decimal(qty)
            return total + NSDecimalNumber(decimal: subtotal).doubleValue
        }
    }

    private var hasSelectedProducts: Bool {
        quantities.values.contains { $0 > 0 }
    }

    var body: some View {
        Form {
            Section {
                Text("Add Debt")
                    .font(.title)
                    .bold()
                    .listRowBackground(Color.clear)
            }

            if borrowersStore.borrowers.isEmpty {
                Section {
                    Text("No borrower added yet.")
                        .foregroundStyle(.secondary)
                }
            } else {
                Section {
                    Button {
                        showBorrowerPicker = true
                    } label: {
                        HStack {
                            Text("Borrower")
                                .foregroundStyle(.primary)
                            Spacer()
                            if let id = selectedBorrowerId,
                               let borrower = borrowersStore.borrowers.first(where: { $0.id == id }) {
                                Text(borrower.fullName)
                                    .foregroundStyle(.secondary)
                            } else {
                                Text("Select Borrower")
                                    .foregroundStyle(.secondary)
                            }
                            Image(systemName: "chevron.right")
                                .font(.caption)
                                .foregroundStyle(.tertiary)
                        }
                    }
                }
                .sheet(isPresented: $showBorrowerPicker) {
                    NavigationStack {
                        SelectBorrowerView(selectedBorrowerId: $selectedBorrowerId)
                    }
                }

                Section {
                    Button {
                        showProductsPicker = true
                    } label: {
                        HStack {
                            Text("Products")
                                .foregroundStyle(.primary)
                            Spacer()
                            let selectedCount = quantities.values.filter { $0 > 0 }.count
                            if selectedCount > 0 {
                                Text("\(selectedCount) selected")
                                    .foregroundStyle(.secondary)
                            } else {
                                Text("Select Products")
                                    .foregroundStyle(.secondary)
                            }
                            Image(systemName: "chevron.right")
                                .font(.caption)
                                .foregroundStyle(.tertiary)
                        }
                    }
                }
                .sheet(isPresented: $showProductsPicker) {
                    NavigationStack {
                        SelectProductsView(quantities: $quantities)
                    }
                }

                Section {
                    TextField("Notes (optional)", text: $notes)
                }

                Section {
                    HStack {
                        Text("Total")
                            .font(.headline)
                        Spacer()
                        Text("₱\(computedTotal, specifier: "%.2f")")
                            .font(.title2)
                            .bold()
                    }
                }

                Section {
                    Button("Save") {
                        guard let borrowerId = selectedBorrowerId,
                              hasSelectedProducts else { return }

                        let newId = (transactionsStore.transactions.map { $0.id }.max() ?? 0) + 1
                        let trimmedNotes = notes.trimmingCharacters(in: .whitespacesAndNewlines)

                        let lineItems: [DebtLineItem] = productsStore.products.compactMap { product in
                            guard let price = product.price,
                                  let qty = quantities[product.id], qty > 0 else { return nil }
                            return DebtLineItem(productId: product.id, productName: product.name, unitPrice: price, quantity: qty)
                        }

                        let debt = Debt(
                            id: newId,
                            totalAmount: computedTotal,
                            borrowerId: borrowerId,
                            notes: trimmedNotes.isEmpty ? nil : trimmedNotes,
                            lineItems: lineItems
                        )
                        transactionsStore.transactions.append(debt)
                        dismiss()
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.blue)
                    .disabled(!hasSelectedProducts || selectedBorrowerId == nil)
                }
            }
        }
    }
}

#Preview {
    let borrowers = BorrowersStore(borrowers: [
        Borrower(id: 1, firstName: "Juan", lastName: "Dela Cruz"),
        Borrower(id: 2, firstName: "Maria", lastName: "Santos")
    ])
    let products = ProductsStore(products: [
        Product(id: 1, name: "Shampoo", price: 45.00, categoryId: 1),
        Product(id: 2, name: "Soap", price: 30.00, categoryId: 1),
        Product(id: 3, name: "Unknown Item", price: nil, categoryId: 2)
    ])
    return AddDebtView()
        .environment(borrowers)
        .environment(TransactionsStore())
        .environment(products)
}
