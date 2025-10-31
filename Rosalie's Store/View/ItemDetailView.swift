//
//  ItemDetailView.swift
//  Rosalie's Store
//
//  Created by Joseph Callao on 7/30/25.
//

import SwiftUI

struct ItemDetailView: View {
    @Environment(NavigationContext.self) private var navContext
    var body: some View {
        @Bindable var context = navContext
        if let selectedItem = context.selectedItem {
            ItemDetailRouteView(item: selectedItem)
        } else {
            Text("Please select from the item list")
        }
    }
}

private struct ItemDetailRouteView: View {
    var item: SelectedItem?
    var body: some View {
        switch item {
        case .borrower(let id):
            BorrowerDashboard(borrowerId: id)
        case .transaction(let type):
            TransactionRoute(type: type)
        case .product(let id):
            ProductDashboard(id: id)
        default:
            Text("Select from the menu")
        }
    }
}

private struct TransactionRoute: View {
    var type: TransactionType?
    var body: some View {
        switch type {
        case .debt:
            DebtDashboard()
        case .payment:
            PaymentDashboard()
        default:
            Text("Select a transaction type.")
        }
    }
}

#Preview {
    ItemDetailView()
        .environment(NavigationContext())
}

#Preview {
    TransactionRoute(type: .payment)
}
