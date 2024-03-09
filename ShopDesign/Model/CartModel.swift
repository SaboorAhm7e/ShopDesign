//
//  CartModel.swift
//  ShopDesign
//
//  Created by Saboor on 09/03/2024.
//

import SwiftUI
import SwiftData

@Model
class CartModel {
    var item : ProductPersistentModel
    var quantity : Int
    
    init(item: ProductPersistentModel, quantity: Int) {
        self.item = item
        self.quantity = quantity
    }
}
