//
//  Debt.swift
//  Rosalie's Store
//
//  Created by Joseph Callao on 7/28/25.
//

import Foundation

struct Debt : Identifiable, Hashable {
    let id: UUID
    var borrowerId: UUID
    var amount: Double
    var date: Date
    var notes: String?
    
}
