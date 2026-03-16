import Foundation
import Observation

@Observable
final class ProductsStore {
    var products: [Product] = []

    init(products: [Product] = []) {
        self.products = products
    }
}
