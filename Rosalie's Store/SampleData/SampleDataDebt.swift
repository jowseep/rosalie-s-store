//
//  SampleDataDebt.swift
//  Rosalie's Store
//
//  Created by Joseph Callao on 7/28/25.
//

import Foundation

struct SampleDataDebt {
    static let borrower1 = Borrower(firstName: "Juan", lastName: "Dela Cruz")
    static let borrower2 = Borrower(firstName: "Maria", lastName: "Santos")
    static let borrower3 = Borrower(firstName: "Jose", lastName: "Rizal")
    
    static var borrowers: [Borrower] {
        [borrower1, borrower2, borrower3]
    }
    
    static var debts: [Debt] {
        [
            Debt(id: UUID(), borrowerId: borrower1.id, amount: 150.00, date: Date(timeIntervalSinceNow: -86400 * 2), notes: "Snacks and drinks"),
            Debt(id: UUID(), borrowerId: borrower2.id, amount: 75.50, date: Date(timeIntervalSinceNow: -86400 * 5), notes: "Milk and canned goods"),
            Debt(id: UUID(), borrowerId: borrower1.id, amount: 200.00, date: Date(timeIntervalSinceNow: -86400 * 1), notes: "Rice and noodles"),
            Debt(id: UUID(), borrowerId: borrower3.id, amount: 50.00, date: Date(timeIntervalSinceNow: -86400 * 3), notes: "Soft drinks"),
            Debt(id: UUID(), borrowerId: borrower2.id, amount: 100.00, date: Date(timeIntervalSinceNow: -86400 * 7), notes: "Personal care items")
        ]
    }
}
