//
//  BorrowerDashboard.swift
//  Rosalie's Store
//
//  Created by Joseph Callao on 7/20/25.
//

import SwiftUI

struct BorrowerDashboard: View {
    var id: Int;
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("Jessa Zaragoza")
                        .font(.largeTitle.bold())
                    Text("Current debt: P5,900.00")
                        .font(.subheadline)
                    Spacer()
                }
                Spacer()
            }
        }
        .padding(.leading)
    }
}

#Preview {
    BorrowerDashboard(id: 1)
}
