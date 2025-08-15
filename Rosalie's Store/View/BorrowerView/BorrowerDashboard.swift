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
        VStack {
            VStack {
                Text("Jessa Zaragoza")
                    .font(.largeTitle.bold())
                Text("Current debt: P341.00")
                    .font(.subheadline)
            }
            .padding(.bottom)
            
            Picker("Select Tab", selection: $selectedTab) {
                Text("Debts").tag(0)
                Text("Payments").tag(1)
            }
            .pickerStyle(.segmented)
            .frame(width: UIScreen.main.bounds.width / 2)
            .padding(.bottom)
            
            if selectedTab == 0 {
                DebtDashboard()
            } else {
                PaymentDashboard()
            }
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    BorrowerDashboard(id: 1)
}
