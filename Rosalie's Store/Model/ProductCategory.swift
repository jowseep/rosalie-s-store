import Foundation

/// A product category with a unique identifier and display name.
struct ProductCategory: Identifiable, Codable, Hashable {
    /// Stable unique identifier for the category.
    var id: Int

    /// Human-readable category name.
    var name: String

    /// Creates a new product category.
    /// - Parameters:
    ///   - id: The unique integer identifier.
    ///   - name: The display name for the category.
    init(id: Int, name: String) {
        self.id = id
        self.name = name
    }
}
