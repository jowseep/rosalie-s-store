//
//  Debt.swift
//  Rosalie's Store
//
//  Created by Joseph Callao on 7/28/25.
//

import Foundation

class Debt : Transaction {
    var notes: String?
    var lineItems: [DebtLineItem]

    init(id: Int, totalAmount: Double, borrowerId: Int, notes: String? = nil, lineItems: [DebtLineItem] = []) {
        self.notes = notes
        self.lineItems = lineItems
        super.init(id: id, totalAmount: totalAmount, type: .debt, borrowerId: borrowerId)
    }
}
