import SwiftUI

struct AddTransactionView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var notes: String = ""

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Add Transaction")
                .font(.title)
                .bold()

            TextField("Enter details", text: $notes)
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
    AddTransactionView()
}
