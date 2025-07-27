//
//  MenuContext.swift
//  Rosalie's Store
//
//  Created by Joseph Callao on 7/26/25.
//

import SwiftUI

struct MenuContext: View {
    @Binding var selectedOption: Option?
    var body: some View {
        Group {
            switch selectedOption {
            case .borrower:
                BorrowerDashboard()
            case .debt:
                DebtDashboard()
            case .payment:
                PaymentDashboard()
            case .product:
                ProductDashboard()
            case nil:
                Text("Please select an option from the menu.")
            }
        }
    }
}
