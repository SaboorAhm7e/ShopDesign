//
//  ProductViewModel.swift
//  ShopDesign
//
//  Created by Saboor on 28/02/2024.
//

import Foundation
import Observation

@Observable
class ProductViewModel {
    var products : [Product] = []
    func loadProducts() {
        if let loadProducts : [Product] = Bundle.main.decode(type: [Product].self, filename: "products.json") {
                self.products = loadProducts
            }
        }
}
