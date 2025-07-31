//
//  SelectedItem.swift
//  Rosalie's Store
//
//  Created by Joseph Callao on 7/28/25.
//

import Foundation

enum SelectedItem : Hashable {
    case borrower(UUID)
    case debt(UUID)
    case payment(UUID)
    case product(UUID)
}
