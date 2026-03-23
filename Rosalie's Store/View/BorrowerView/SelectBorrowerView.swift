import SwiftUI

struct SelectBorrowerView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(BorrowersStore.self) private var borrowersStore

    @Binding var selectedBorrowerId: Int?
    @State private var searchText: String = ""

    private var filteredBorrowers: [Borrower] {
        if searchText.count >= 3 {
            return borrowersStore.borrowers.filter {
                $0.fullName.localizedCaseInsensitiveContains(searchText)
            }
        }
        return borrowersStore.borrowers
    }

    private var selectedBorrower: Borrower? {
        guard let id = selectedBorrowerId else { return nil }
        return borrowersStore.borrowers.first { $0.id == id }
    }

    var body: some View {
        List {
            if let selected = selectedBorrower {
                Section("Selected borrower") {
                    HStack {
                        Text(selected.fullName)
                        Spacer()
                        Image(systemName: "checkmark")
                            .foregroundStyle(.green)
                    }
                }
            }

            Section("Borrowers") {
                if filteredBorrowers.isEmpty {
                    Text("No borrowers found.")
                        .foregroundStyle(.secondary)
                } else {
                    ForEach(filteredBorrowers) { borrower in
                        Button {
                            selectedBorrowerId = borrower.id
                            dismiss()
                        } label: {
                            Text(borrower.fullName)
                                .foregroundStyle(.primary)
                        }
                    }
                }
            }
        }
        .navigationTitle("Select Borrower")
        .searchable(text: $searchText, prompt: "type here")
    }
}

#Preview {
    @Previewable @State var selectedId: Int? = 1
    let store = BorrowersStore(borrowers: [
        Borrower(id: 1, firstName: "Joseph", lastName: "Callao"),
        Borrower(id: 2, firstName: "Maria", lastName: "Santos"),
        Borrower(id: 3, firstName: "Juan", lastName: "Dela Cruz")
    ])
    NavigationStack {
        SelectBorrowerView(selectedBorrowerId: $selectedId)
    }
    .environment(store)
}
