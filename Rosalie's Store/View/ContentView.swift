//
//  ContentView.swift
//  Rosalie's Store
//
//  Created by Joseph Callao on 7/20/25.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedOption: Option?
    
    var body: some View {
        NavigationSplitView {
            VStack {
                List(Option.allCases, selection: $selectedOption) { option in
                    NavigationLink(value: option) {
                        Label(option.title, systemImage: option.icon)
                    }
                }
                .navigationTitle("Menu")
                
                Button(action: {
                    print("Temporary")
                }) {
                    Label("Settings", systemImage: "gear")
                        .padding(.vertical, 8)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .buttonStyle(PlainButtonStyle()) // Optional for consistent look
                        .padding(.horizontal)
                        .padding(.bottom)
            }
        } detail: {
            MenuContext(selectedOption: $selectedOption)
        }
    }
}

#Preview {
    ContentView()
}
