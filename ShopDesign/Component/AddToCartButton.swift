//
//  AddToCartButton.swift
//  ShopDesign
//
//  Created by Saboor on 29/02/2024.
//

import SwiftUI
import SwiftData

struct AddToCartButton: View {
    
    var product : ProductPersistentModel
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
            Button {
                addItem()
            } label: {
                HStack {
                    Image(systemName: "cart")
                    Text("Add to Cart")
                }
            }
            .buttonStyle(BlackButtonStyle())
    }
    
    func addItem() {
        
        do {
            let cartItem = CartModel(item: product, quantity: 1)
            
            // Ensure fetch is successful
            let fetchDescriptor = FetchDescriptor<CartModel>()
            let items = try modelContext.fetch(fetchDescriptor)
            
            // Check if item is already in the cart
            let containitem = items.contains { $0.item == product }
            
            if !containitem {
                modelContext.insert(cartItem)
                // Save changes
                try modelContext.save()
            }
        } catch {
            fatalError("failed to add value: \(error)")
        }
    }
}
