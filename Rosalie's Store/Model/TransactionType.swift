//
//  TransactionType.swift
//  Rosalie's Store
//
//  Created by Joseph Callao on 8/2/25.
//

import Foundation

enum TransactionType : String, Hashable, Identifiable, CaseIterable {
    case debt
    case payment
    
    var id: String { rawValue }
    
    var title: String {
        switch self {
        case .debt: return "Debt"
        case .payment: return "Payment"
        }
    }
}
