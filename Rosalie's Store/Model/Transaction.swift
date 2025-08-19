//
//  Transaction.swift
//  Rosalie's Store
//
//  Created by Joseph Callao on 8/17/25.
//

import Foundation

class Transaction : Identifiable {
    var id: Int
    var totalAmount: Double
    var date: Date
    var type: TransactionType
    
    init(id: Int, totalAmount: Double, type: TransactionType) {
        self.id = id
        self.totalAmount = totalAmount
        self.date = Date()
        self.type = type
    }
    
    var formattedDate: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"
        return formatter.string(from: date)
    }
}
