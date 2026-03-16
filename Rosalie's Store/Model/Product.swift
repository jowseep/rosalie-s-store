import Foundation

/// A product in the catalog.
struct Product: Identifiable, Codable, Hashable {
    /// Stable unique identifier for the product.
    var id: Int

    /// Human-readable product name.
    var name: String

    /// Optional unit price for the product.
    var price: Decimal?

    /// Identifier of the category this product belongs to.
    var categoryId: Int

    /// Optional size descriptor (e.g., S, M, L, or dimensions). Can be nil.
    var size: String?

    /// Creates a new product.
    /// - Parameters:
    ///   - id: The unique integer identifier.
    ///   - name: The product name.
    ///   - price: An optional unit price for the product.
    ///   - categoryId: The integer identifier of the category.
    ///   - size: An optional size descriptor.
    init(id: Int, name: String, price: Decimal? = nil, categoryId: Int, size: String? = nil) {
        self.id = id
        self.name = name
        self.price = price
        self.categoryId = categoryId
        self.size = size
    }
}
