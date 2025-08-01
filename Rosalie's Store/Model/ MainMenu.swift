//
//  Option.swift
//  Rosalie's Store
//
//  Created by Joseph Callao on 7/20/25.
//

import Foundation

enum MainMenu : String, CaseIterable, Identifiable {
    case borrower
    case debt
    case payment
    case product
    
    //var id: Self { self } // Conforming to Identifiable
    var id: String { rawValue }
    
    var title: String {
        switch self {
        case .borrower: return "Borrower"
        case .debt: return "Debt"
        case .payment: return "Payment"
        case .product: return "Product"
        }
    }
    
    var icon: String {
        switch self {
        case .borrower: return "person.2"
        case .debt: return "creditcard"
        case .payment: return "pesosign"
        case .product: return "cube.box"
        }
    }
}
