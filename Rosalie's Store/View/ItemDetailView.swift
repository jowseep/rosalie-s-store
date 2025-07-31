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
        @Bindable var navContext = navContext
        if (navContext.selectedItem != nil) {
            Text("This is item detail")
        } else {
            Text("Please select from the item list")
        }
    }
}

#Preview {
    ItemDetailView()
        .environment(NavigationContext())
}
