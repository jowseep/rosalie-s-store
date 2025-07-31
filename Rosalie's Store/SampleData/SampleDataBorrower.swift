//
//  SampleDataBorrower.swift
//  Rosalie's Store
//
//  Created by Joseph Callao on 7/28/25.
//

import Foundation

struct SampleDataBorrower : Hashable {
    let borrowers: [Borrower] = [
        Borrower(firstName: "Juan", lastName: "Dela Cruz"),
        Borrower(firstName: "Maria", lastName: "Santos"),
        Borrower(firstName: "Jose", lastName: "Rizal"),
        Borrower(firstName: "Ana", lastName: "Reyes"),
        Borrower(firstName: "Pedro", lastName: "Garcia"),
        Borrower(firstName: "Luisa", lastName: "Fernandez"),
        Borrower(firstName: "Carlos", lastName: "Torres"),
        Borrower(firstName: "Isabel", lastName: "Lopez"),
        Borrower(firstName: "Miguel", lastName: "Domingo"),
        Borrower(firstName: "Rosa", lastName: "Bautista")
    ]
}
