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
            List(Option.allCases, selection: $selectedOption) { option in
                NavigationLink(value: option) {
                    Label(option.title, systemImage: option.icon)
                }
            }
            .navigationTitle("Menu")
        } detail: {
            if let option = selectedOption {
                switch option {
                case .borrower:
                    BorrowerDashboard()
                case .debt:
                    DebtDashboard()
                case .payment:
                    PaymentDashboard()
                case .product:
                    ProductDashboard()
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
