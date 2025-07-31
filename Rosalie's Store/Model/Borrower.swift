//
//  Borrower.swift
//  Rosalie's Store
//
//  Created by Joseph Callao on 7/27/25.
//

import Foundation

struct Borrower : Identifiable, Hashable {
    let id = UUID()
    var firstName: String
    var lastName: String
    
    var fullName: String {
        return "\(firstName) \(lastName)"
    }
}
