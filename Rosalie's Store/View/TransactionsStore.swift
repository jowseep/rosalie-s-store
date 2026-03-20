import Foundation

@Observable
final class TransactionsStore {
    var transactions: [Transaction]

    init(transactions: [Transaction] = []) {
        self.transactions = transactions
    }
}
