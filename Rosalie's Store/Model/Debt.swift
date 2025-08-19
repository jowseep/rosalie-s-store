//
//  Debt.swift
//  Rosalie's Store
//
//  Created by Joseph Callao on 7/28/25.
//

import Foundation

class Debt : Transaction {
    var notes: String?
    
    init(id: Int, totalAmount: Double, notes: String? = nil) {
        self.notes = notes
        super.init(id: id, totalAmount: totalAmount, type: .debt)
    }
}
