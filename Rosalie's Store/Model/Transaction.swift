//
//  Transaction.swift
//  Rosalie's Store
//
//  Created by Joseph Callao on 8/17/25.
//

import Foundation

class Transaction {
    var id: Int
    var totalAmount: Double
    var date: Date
    var type: TransactionType
    
    init(totalAmount: Double, type: TransactionType) {
        self.id = Int()
        self.totalAmount = totalAmount
        self.date = Date()
        self.type = type
    }
}
