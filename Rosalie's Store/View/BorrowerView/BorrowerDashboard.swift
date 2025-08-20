//
//  BorrowerDashboard.swift
//  Rosalie's Store
//
//  Created by Joseph Callao on 7/20/25.
//

import SwiftUI

struct BorrowerDashboard: View {
    @State private var selectedTab: Int = 0
    var id: Int;
    var body: some View {
        List {
            VStack {
                Image(systemName: "person.crop.circle") // avatar
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80, height: 80)
                                    .foregroundStyle(.blue) // can customize color
                                    .padding(.bottom, 4)

                Text("Jessa Zaragoza")
                    .font(.title.bold())
                Text("Current debt: ₱341.00")
                    .foregroundStyle(.secondary)
            }
            .frame(maxWidth: .infinity, alignment: .center)
            .listRowBackground(Color.clear)
            .listRowInsets(EdgeInsets())
            
            // We can maybe iterate through TransactionType so we won't have to repeat the section
            
            Section(TransactionType.debt.title) {
                ForEach(debts) { debt in
                    HStack {
                        Text("₱\(String(format: "%.2f", debt.totalAmount))")
                        Spacer()
                        Text("\(debt.formattedDate)")
                            .foregroundStyle(.secondary)
                    }
                }
                Button("Add Debt", systemImage: "plus") {
                    print("Adding debt")
                }
            }
            
            Section(TransactionType.payment.title) {
                ForEach(payments) { payment in
                    HStack {
                        Text("₱\(String(format: "%.2f", payment.totalAmount))")
                        Spacer()
                        Text(payment.formattedDate)
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

private var debts = [
    Debt(id: 1, totalAmount: 90, notes: "Sabon, Shampoo"),
    Debt(id: 2, totalAmount: 55, notes: "Del, Ariel"),
    Debt(id: 3, totalAmount: 111, notes: "Uling, Toothpaste"),
    Debt(id: 4, totalAmount: 149, notes: "Load, Surf"),
    Debt(id: 5, totalAmount: 56, notes: "Kape, Sugar")
]

private var payments = [
    Payment(id: 1, totalAmount: 270, refNumber: "RS1001"),
    Payment(id: 2, totalAmount: 310, refNumber: "RS1002"),
]

#Preview {
    BorrowerDashboard(id: 1)
}
