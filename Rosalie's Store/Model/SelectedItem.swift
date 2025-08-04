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
}
