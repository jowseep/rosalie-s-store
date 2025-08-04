//
//  TransactionListView.swift
//  Rosalie's Store
//
//  Created by Joseph Callao on 8/2/25.
//

import SwiftUI

struct TransactionListView: View {
    @Environment(NavigationContext.self) private var navContext
    var body: some View {
        @Bindable var context = navContext
        List(TransactionType.allCases, selection: $context.selectedItem) { type in
            NavigationLink(value: SelectedItem.transaction(type)) {
                Text(type.title)
            }
        }
    }
}

#Preview {
    TransactionListView()
        .environment(NavigationContext())
}
