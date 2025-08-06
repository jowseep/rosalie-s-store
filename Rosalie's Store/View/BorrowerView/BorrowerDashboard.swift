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
        Text("Welcome to borrower: \(id)")
    }
}

#Preview {
    BorrowerDashboard(id: 1)
}
