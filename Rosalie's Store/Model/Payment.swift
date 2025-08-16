//
//  Payment.swift
//  Rosalie's Store
//
//  Created by Joseph Callao on 8/17/25.
//

import Foundation

class Payment : Transaction {
    var refNumber: String?
    
    init(totalAmount: Double, refNumber: String?) {
        self.refNumber = refNumber
        super.init(totalAmount: totalAmount, type: .payment)
    }
}
