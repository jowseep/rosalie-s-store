import SwiftUI

struct AddDebtView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(BorrowersStore.self) private var borrowersStore
    @Environment(TransactionsStore.self) private var transactionsStore
    @Environment(ProductsStore.self) private var productsStore

    @State private var selectedBorrowerId: Int?
    @State private var showBorrowerPicker = false

    init(initialBorrowerId: Int? = nil) {
        _selectedBorrowerId = State(initialValue: initialBorrowerId)
    }
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

    private var selectedBorrowerName: String? {
        guard let id = selectedBorrowerId else { return nil }
        return borrowersStore.borrowers.first { $0.id == id }?.fullName
    }

    private var selectedProductsLabel: String {
        let count = quantities.values.filter { $0 > 0 }.count
        return count == 0 ? "click search to find" : "\(count) products selected"
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                Text("Add Debt")
                    .font(.title)
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .center)

                HStack {
                    Text("Borrower:").bold()
                    Text(selectedBorrowerName ?? "click search to find")
                        .italic(selectedBorrowerName == nil)
                        .foregroundStyle(selectedBorrowerName == nil ? .secondary : .primary)
                    Spacer()
                    Button {
                        showBorrowerPicker = true
                    } label: {
                        Image(systemName: "magnifyingglass")
                            .foregroundStyle(.primary)
                    }
                }
                .sheet(isPresented: $showBorrowerPicker) {
                    NavigationStack {
                        SelectBorrowerView(selectedBorrowerId: $selectedBorrowerId)
                    }
                }

                HStack {
                    Text("Products:").bold()
                    let count = quantities.values.filter { $0 > 0 }.count
                    Text(selectedProductsLabel)
                        .italic(count == 0)
                        .foregroundStyle(count == 0 ? .secondary : .primary)
                    Spacer()
                    Button {
                        showProductsPicker = true
                    } label: {
                        Image(systemName: "magnifyingglass")
                            .foregroundStyle(.primary)
                    }
                }
                .sheet(isPresented: $showProductsPicker) {
                    NavigationStack {
                        SelectProductsView(quantities: $quantities)
                    }
                }

                TextField("Notes (optional)", text: $notes)
                    .padding(10)
                    .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color(.systemGray4)))

                HStack {
                    Text("Total").bold()
                    Spacer()
                    Text("₱\(computedTotal, specifier: "%.2f")").bold()
                }
                .padding(10)
                .background(Color(.systemBackground), in: RoundedRectangle(cornerRadius: 8))

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
                .disabled(!hasSelectedProducts || selectedBorrowerId == nil)
                .frame(maxWidth: .infinity)
            }
            .padding()
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
