//
//  BorrowerListView.swift
//  Rosalie's Store
//
//  Created by Joseph Callao on 7/30/25.
//

import SwiftUI

struct BorrowerListView: View {
    @Environment(BorrowersStore.self) private var borrowersStore
    @Environment(NavigationContext.self) private var navContext

    var body: some View {
        @Bindable var nav = navContext
        if borrowersStore.borrowers.isEmpty {
            ContentUnavailableView("No borrowers yet", systemImage: "person.2", description: Text("Tap + to add your first borrower."))
        } else {
            List(borrowersStore.borrowers, selection: $nav.selectedItem) { borrower in
                NavigationLink(value: SelectedItem.borrower(borrower.id)) {
                    Text(borrower.fullName)
                }
            }
        }
    }
}

#Preview {
    let store = BorrowersStore(borrowers: [
        Borrower(id: 1, firstName: "Juan", lastName: "Dela Cruz"),
        Borrower(id: 2, firstName: "Maria", lastName: "Santos")
    ])
    return BorrowerListView()
        .environment(NavigationContext())
        .environment(store)
}
