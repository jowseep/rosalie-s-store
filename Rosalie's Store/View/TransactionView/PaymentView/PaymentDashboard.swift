//
//  PaymentDashboard.swift
//  Rosalie's Store
//
//  Created by Joseph Callao on 7/20/25.
//

import SwiftUI

struct PaymentDashboard: View {
    var body: some View {
        Table(people) {
                    TableColumn("Amount", value: \.givenName)
                    TableColumn("Date", value: \.familyName)
                    TableColumn("Reference", value: \.emailAddress)
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


private var people = [
    Payments(givenName: "509.00", familyName: "04/26/25", emailAddress: "1000931")
]

#Preview {
    PaymentDashboard()
}
