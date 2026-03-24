import SwiftUI

struct AddProductView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var name: String = ""
    @State private var categoryId: Int = ProductCategory.all.first?.id ?? 0
    @State private var size: String = ""
    @Environment(ProductsStore.self) private var productsStore
    @State private var price: String = ""

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Add Product")
                .font(.title)
                .bold()

            TextField("Enter product name", text: $name)
                .textFieldStyle(.roundedBorder)

            TextField("Price", text: $price)
                .keyboardType(.decimalPad)
                .textFieldStyle(.roundedBorder)

            Picker("Category", selection: $categoryId) {
                ForEach(ProductCategory.all) { category in
                    Text(category.name).tag(category.id)
                }
            }
            .pickerStyle(.menu)

            TextField("Size (optional)", text: $size)
                .textFieldStyle(.roundedBorder)

            Button("Save") {
                // Construct and save the new product
                let newId = (productsStore.products.map { $0.id }.max() ?? 0) + 1
                let trimmedName = name.trimmingCharacters(in: .whitespacesAndNewlines)
                let trimmedSize = size.trimmingCharacters(in: .whitespacesAndNewlines)
                guard !trimmedName.isEmpty else { return }

                let parsedPrice = Decimal(string: price.trimmingCharacters(in: .whitespacesAndNewlines))
                let product = Product(
                    id: newId,
                    name: trimmedName,
                    price: parsedPrice,
                    categoryId: categoryId,
                    size: trimmedSize.isEmpty ? nil : trimmedSize
                )
                productsStore.products.append(product)
                dismiss()
            }
            .buttonStyle(.borderedProminent)
            .tint(.blue)

            Spacer()
        }
        .padding()
    }
}

#Preview {
    AddProductView()
}
