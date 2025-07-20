//
//  ContentView.swift
//  Rosalie's Store
//
//  Created by Joseph Callao on 7/20/25.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedOption: Option? = nil
    
    var body: some View {
        NavigationSplitView {
            List(Option.allCases, selection: $selectedOption) { option in
                Label(option.title, systemImage: "house")
            }
            .navigationTitle("Menu")
        } detail: {
            if let option = selectedOption {
                switch option {
                case .borrower:
                    Text("Borrower")
                case .debt:
                    Text("Debt")
                case .payment:
                    Text("Payment")
                case .product:
                    Text("Product")
                }
            } else {
                Text("Welcome to Rosalie's Store")
            }
        }
    }
}

#Preview {
    ContentView()
}
