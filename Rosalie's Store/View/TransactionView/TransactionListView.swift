//
//  TransactionListView.swift
//  Rosalie's Store
//
//  Created by Joseph Callao on 8/2/25.
//

import SwiftUI

struct TransactionListView: View {
    @State private var selection: TransactionType?
    var body: some View {
        List(TransactionType.allCases, selection: $selection) { type in
            NavigationLink(value: type) {
                Text(type.title)
            }
        }
    }
}

#Preview {
    TransactionListView()
}
