//
//  DebtDashboard.swift
//  Rosalie's Store
//
//  Created by Joseph Callao on 7/20/25.
//

import SwiftUI

struct DebtDashboard: View {
    var body: some View {
        VStack {
            Table(people) {
                TableColumn("Amount", value: \.givenName)
                TableColumn("Date", value: \.familyName)
                TableColumn("Notes", value: \.emailAddress)
            }
        }
        
    }
}

struct Person: Identifiable {
    let givenName: String
    let familyName: String
    let emailAddress: String
    let id = UUID()


    var fullName: String { givenName + " " + familyName }
}


private var people = [
    Person(givenName: "90.00", familyName: "04/26/25", emailAddress: "Sabon, Shampoo"),
    Person(givenName: "55.00", familyName: "04/25/25", emailAddress: "Del, Ariel"),
    Person(givenName: "111.00", familyName: "04/24/25", emailAddress: "Uling, Toothpaste"),
    Person(givenName: "85.00", familyName: "04/23/25", emailAddress: "Load, Egg")
]

#Preview {
    DebtDashboard()
}
