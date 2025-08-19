//
//  PaymentDashboard.swift
//  Rosalie's Store
//
//  Created by Joseph Callao on 7/20/25.
//

import SwiftUI

struct PaymentDashboard: View {
    var body: some View {
        List {
            Section(TransactionType.payment.title) {
                ForEach(payments) { payment in
                    HStack {
                        Text("₱\(payment.givenName)")
                        Spacer()
                        Text(payment.familyName)
                            .foregroundStyle(.secondary)
                    }
                }
                Button("Add Payment", systemImage: "plus") {
                    print("Adding debt")
                }
            }
        }
    }
}

struct Payments: Identifiable {
    let givenName: String
    let familyName: String
    let emailAddress: String
    let id = UUID()


    var fullName: String { givenName + " " + familyName }
}


private var payments = [
    Payments(givenName: "509.00", familyName: "04/26/25", emailAddress: "1000931"),
    Payments(givenName: "90.00", familyName: "04/26/25", emailAddress: "Sabon, Shampoo"),
    Payments(givenName: "55.00", familyName: "04/25/25", emailAddress: "Del, Ariel"),
    Payments(givenName: "111.00", familyName: "04/24/25", emailAddress: "Uling, Toothpaste"),
    Payments(givenName: "90.00", familyName: "04/26/25", emailAddress: "Sabon, Shampoo"),
    Payments(givenName: "55.00", familyName: "04/25/25", emailAddress: "Del, Ariel"),
    Payments(givenName: "111.00", familyName: "04/24/25", emailAddress: "Uling, Toothpaste"),
]

#Preview {
    PaymentDashboard()
}
