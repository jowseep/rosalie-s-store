import Foundation

@Observable
final class BorrowersStore {
    var borrowers: [Borrower]

    init(borrowers: [Borrower] = []) {
        self.borrowers = borrowers
    }
}
