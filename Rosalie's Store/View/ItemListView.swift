//
//  ItemListView.swift
//  Rosalie's Store
//
//  Created by Joseph Callao on 7/29/25.
//

import SwiftUI

struct ItemListView: View {
    @State private var showingAddSheet = false
    @Environment(NavigationContext.self) private var navContext
    var body: some View {
        @Bindable var context = navContext
        Group {
            switch context.selectedMenu {
            case .borrower:
                BorrowerListView()
            case .transaction:
                TransactionListView()
            case .product:
                ProductListView()
            default:
                Text("Select from menu")
            }
        }
        .toolbar {
            if context.selectedMenu != .transaction {
                ToolbarItem(placement: .primaryAction) {
                    Button {
                        showingAddSheet = true
                    } label: {
                        Image(systemName: "plus")
                            .padding()
                            .foregroundColor(.blue)
                    }
                    .accessibilityLabel(addButtonAccessibilityLabel(for: context.selectedMenu))
                }
            }
        }
        .sheet(isPresented: $showingAddSheet) {
            addSheetContent(for: context.selectedMenu)
        }
    }

    private func addButtonAccessibilityLabel(for menu: MainMenu?) -> String {
        switch menu {
        case .borrower:
            return "Add Borrower"
        case .product:
            return "Add Product"
        default:
            return "Add"
        }
    }

    @ViewBuilder
    private func addSheetContent(for menu: MainMenu?) -> some View {
        switch menu {
        case .borrower:
            AddBorrowerView()
        case .product:
            AddProductView()
        default:
            Text("Add Item")
                .font(.title2)
                .padding()
        }
    }
}

#Preview {
    ItemListView()
        .environment(NavigationContext())
}
