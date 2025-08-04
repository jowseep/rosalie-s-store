//
//  ContentView.swift
//  Rosalie's Store
//
//  Created by Joseph Callao on 7/20/25.
//

import SwiftUI

struct ContentView: View {
    @State private var navContext = NavigationContext()
    var body: some View {
        NavigationSplitView() {
            MenuList(navContext: navContext)
                .navigationTitle(navContext.sidebarTitle)
        } content: {
            ItemListView()
                .environment(navContext)
                .navigationTitle(navContext.itemListTitle)
        }
        detail: {
            ItemDetailView()
                .environment(navContext)
        }
    }
}

private struct MenuList: View {
    @Bindable var navContext: NavigationContext
    var body: some View {
        List(MainMenu.allCases, selection: $navContext.selectedMenu) { option in
            NavigationLink(value: option) {
                Label(option.title, systemImage: option.icon)
            }
        }
    }
}

#Preview {
    ContentView()
}
