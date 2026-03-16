import Foundation

extension ProductCategory {
    /// Static list of default product categories for use in UI pickers and seed data.
    static let all: [ProductCategory] = [
        ProductCategory(id: 1, name: "Beverages"),
        ProductCategory(id: 2, name: "Snacks"),
        ProductCategory(id: 3, name: "Canned & Packaged Goods"),
        ProductCategory(id: 4, name: "Cooking Essentials"),
        ProductCategory(id: 5, name: "Personal Items"),
        ProductCategory(id: 6, name: "Household Items"),
        ProductCategory(id: 7, name: "Health and Medicine"),
        ProductCategory(id: 8, name: "Tobacco"),
        ProductCategory(id: 9, name: "eLoad"),
        ProductCategory(id: 10, name: "Others")
    ]
}
