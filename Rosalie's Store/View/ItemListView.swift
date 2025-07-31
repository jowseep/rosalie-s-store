//
//  ItemListView.swift
//  Rosalie's Store
//
//  Created by Joseph Callao on 7/29/25.
//

import SwiftUI

struct ItemListView: View {
    @Environment(NavigationContext.self) private var navContext
    
    var body: some View {
        @Bindable var context = navContext
        switch context.selectedMenu {
        case .borrower:
            BorrowerListView()
        case .payment:
            PaymentListView()
        case .debt:
            DebtListView()
        case .product:
            ProductListView()
        default:
            Text("Select from menu")
        }
    }
}

#Preview {
    ItemListView()
        .environment(NavigationContext())
}
