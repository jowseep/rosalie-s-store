//
//  BorrowerListView.swift
//  Rosalie's Store
//
//  Created by Joseph Callao on 7/30/25.
//

import SwiftUI

struct BorrowerListView: View {
    @Environment(NavigationContext.self) private var navContext
    @State private var selection: Borrower?
    var body: some View {
        @Bindable var navContext = navContext
        List(SampleDataBorrower().borrowers, selection: $selection) { borrower in
            NavigationLink(value: borrower) {
                Text(borrower.fullName)
            }
        }
    }
}

#Preview {
    BorrowerListView()
        .environment(NavigationContext())
}
