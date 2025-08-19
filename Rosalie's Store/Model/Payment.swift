//
//  Payment.swift
//  Rosalie's Store
//
//  Created by Joseph Callao on 8/17/25.
//

import Foundation

class Payment : Transaction {
    var refNumber: String?
    
    init(id: Int, totalAmount: Double, refNumber: String?) {
        self.refNumber = refNumber
        super.init(id: id, totalAmount: totalAmount, type: .payment)
    }
}
