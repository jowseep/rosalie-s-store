import SwiftUI

struct SelectProductsView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(ProductsStore.self) private var productsStore

    @Binding var quantities: [Int: Int]
    @State private var searchText: String = ""

    private var selectedProducts: [Product] {
        productsStore.products.filter { (quantities[$0.id] ?? 0) > 0 }
    }

    private var filteredProducts: [Product] {
        if searchText.count >= 3 {
            return productsStore.products.filter {
                $0.name.localizedCaseInsensitiveContains(searchText)
            }
        }
        return productsStore.products
    }

    var body: some View {
        List {
            Section("Selected products") {
                if selectedProducts.isEmpty {
                    Text("Select products below or search above.")
                        .foregroundStyle(.secondary)
                } else {
                    ForEach(selectedProducts) { product in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(product.name)
                                if let price = product.price {
                                    Text("₱\(NSDecimalNumber(decimal: price).doubleValue, specifier: "%.2f")")
                                        .font(.caption)
                                        .foregroundStyle(.secondary)
                                }
                            }
                            Spacer()
                            Stepper(
                                value: Binding(
                                    get: { quantities[product.id, default: 0] },
                                    set: { quantities[product.id] = $0 == 0 ? nil : $0 }
                                ),
                                in: 0...99
                            ) {
                                Text("\(quantities[product.id, default: 0])")
                                    .monospacedDigit()
                            }
                        }
                    }
                }
            }

            Section("Products") {
                if filteredProducts.isEmpty {
                    Text("No products found.")
                        .foregroundStyle(.secondary)
                } else {
                    ForEach(filteredProducts) { product in
                        Button {
                            if (quantities[product.id] ?? 0) == 0 {
                                quantities[product.id] = 1
                            }
                        } label: {
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(product.name)
                                        .foregroundStyle(.primary)
                                    if let price = product.price {
                                        Text("₱\(NSDecimalNumber(decimal: price).doubleValue, specifier: "%.2f")")
                                            .font(.caption)
                                            .foregroundStyle(.secondary)
                                    } else {
                                        Text("No price")
                                            .font(.caption)
                                            .foregroundStyle(.tertiary)
                                    }
                                }
                                Spacer()
                                if (quantities[product.id] ?? 0) > 0 {
                                    Image(systemName: "checkmark")
                                        .foregroundStyle(.green)
                                }
                            }
                        }
                        .disabled(product.price == nil)
                    }
                }
            }
        }
        .navigationTitle("Select Products")
        .searchable(text: $searchText, prompt: "type here")
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                Button("Done") { dismiss() }
            }
        }
    }
}

#Preview {
    @Previewable @State var quantities: [Int: Int] = [1: 1, 2: 1]
    let store = ProductsStore(products: [
        Product(id: 1, name: "Tissue", price: 25.00, categoryId: 1),
        Product(id: 2, name: "Bar soap", price: 30.00, categoryId: 1),
        Product(id: 3, name: "Flour", price: 55.00, categoryId: 2),
        Product(id: 4, name: "Unknown Item", price: nil, categoryId: 2)
    ])
    NavigationStack {
        SelectProductsView(quantities: $quantities)
    }
    .environment(store)
}
