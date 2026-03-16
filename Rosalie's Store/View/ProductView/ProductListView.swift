//
//  ProductListView.swift
//  Rosalie's Store
//
//  Created by Joseph Callao on 7/31/25.
//

import SwiftUI

struct ProductListView: View {
    @Environment(ProductsStore.self) private var productsStore
    @Environment(NavigationContext.self) private var navContext

    var body: some View {
        @Bindable var nav = navContext
        if productsStore.products.isEmpty {
            ContentUnavailableView("No products yet", systemImage: "cart", description: Text("Tap + to add your first product."))
        } else {
            List(productsStore.products, selection: $nav.selectedItem) { product in
                NavigationLink(value: SelectedItem.product(product.id)) {
                    VStack(alignment: .leading, spacing: 4) {
                        Text(product.name)
                            .font(.body)
                        if let size = product.size, !size.isEmpty {
                            Text(size)
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    let store = ProductsStore(products: [
        Product(id: 1, name: "Coffee", categoryId: 1, size: "200g"),
        Product(id: 2, name: "Soap", categoryId: 6)
    ])
    return ProductListView()
        .environment(NavigationContext())
        .environment(store)
}

