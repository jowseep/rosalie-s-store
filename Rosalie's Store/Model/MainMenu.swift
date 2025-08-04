//
//  Option.swift
//  Rosalie's Store
//
//  Created by Joseph Callao on 7/20/25.
//

import Foundation

enum MainMenu : String, CaseIterable, Identifiable {
    case borrower
    case transaction
    case product
    
    //var id: Self { self } // Conforming to Identifiable
    var id: String { rawValue }
    
    var title: String {
        switch self {
        case .borrower: return "Borrowers"
        case .transaction: return "Transactions"
        case .product: return "Products"
        }
    }
    
    var icon: String {
        switch self {
        case .borrower: return "person.2"
        case .product: return "cube.box"
        case .transaction: return "pesosign"
        }
    }
}
