import SwiftUI

struct AddBorrowerView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var name: String = ""

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Add Borrower")
                .font(.title)
                .bold()

            TextField("Enter name", text: $name)
                .textFieldStyle(.roundedBorder)

            Button("Save") {
                // TODO: Hook up save action
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
}
