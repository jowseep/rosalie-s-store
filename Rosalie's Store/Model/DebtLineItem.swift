import Foundation

struct DebtLineItem {
    let productId: Int
    let productName: String
    let unitPrice: Decimal
    let quantity: Int

    var subtotal: Decimal {
        unitPrice * Decimal(quantity)
    }
}
