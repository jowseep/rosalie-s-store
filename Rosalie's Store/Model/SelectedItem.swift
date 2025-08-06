//
//  SelectedItem.swift
//  Rosalie's Store
//
//  Created by Joseph Callao on 7/28/25.
//

import Foundation

enum SelectedItem : Hashable {
    case borrower(Int)
    case transaction(TransactionType)
    case product(Int)
    
    var displayValue: String {
        switch self {
        case .borrower(let id):
            return "Borrower ID: \(id)"
        case .transaction(let type):
            return "Transaction: \(type)" // assuming rawValue exists
        case .product(let id):
            return "Product ID: \(id)"
        }
    }
}
