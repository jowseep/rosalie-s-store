//
//  ProductDashboard.swift
//  Rosalie's Store
//
//  Created by Joseph Callao on 7/20/25.
//

import SwiftUI

struct ProductDashboard: View {
    var id: Int
    var body: some View {
        Text("Product with id \(id)!")
    }
}

#Preview {
    ProductDashboard(id: 1)
}
