import SwiftUI

struct AddBorrowerView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(BorrowersStore.self) private var borrowersStore

    @State private var firstName: String = ""
    @State private var lastName: String = ""

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Add Borrower")
                .font(.title)
                .bold()

            TextField("First name", text: $firstName)
                .textFieldStyle(.roundedBorder)

            TextField("Last name", text: $lastName)
                .textFieldStyle(.roundedBorder)

            Button("Save") {
                let trimmedFirst = firstName.trimmingCharacters(in: .whitespacesAndNewlines)
                let trimmedLast = lastName.trimmingCharacters(in: .whitespacesAndNewlines)
                guard !trimmedFirst.isEmpty, !trimmedLast.isEmpty else { return }

                let newId = (borrowersStore.borrowers.map { $0.id }.max() ?? 0) + 1
                let borrower = Borrower(id: newId, firstName: trimmedFirst, lastName: trimmedLast)
                borrowersStore.borrowers.append(borrower)
                dismiss()
            }
            .buttonStyle(.borderedProminent)
            .tint(.blue)

            Spacer()
        }
        .padding()
    }
}

#Preview {
    AddBorrowerView()
        .environment(BorrowersStore())
}
