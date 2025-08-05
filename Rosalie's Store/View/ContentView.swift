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
            MenuList()
                .navigationTitle(navContext.sidebarTitle)
        } content: {
            ItemListView()
                .navigationTitle(navContext.itemListTitle)
        }
        detail: {
            ItemDetailView()
        }
        .environment(navContext)
    }
}

private struct MenuList: View {
    @Environment(NavigationContext.self) private var navContext
    var body: some View {
        @Bindable var context = navContext
        List(MainMenu.allCases, selection: $context.selectedMenu) { option in
            NavigationLink(value: option) {
                Label(option.title, systemImage: option.icon)
            }
        }
    }
}

#Preview {
    ContentView()
}
