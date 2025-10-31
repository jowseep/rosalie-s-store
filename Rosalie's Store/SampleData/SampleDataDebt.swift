//
//  SampleDataDebt.swift
//  Rosalie's Store
//
//  Created by Joseph Callao on 7/28/25.
//

import Foundation

struct SampleDataDebt {
    static let borrower1 = Borrower(id: 1, firstName: "Juan", lastName: "Dela Cruz")
    static let borrower2 = Borrower(id: 2, firstName: "Maria", lastName: "Santos")
    static let borrower3 = Borrower(id: 3, firstName: "Jose", lastName: "Rizal")
    
    static var borrowers: [Borrower] {
        [borrower1, borrower2, borrower3]
    }
}
