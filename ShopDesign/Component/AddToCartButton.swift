//
//  AddToCartButton.swift
//  ShopDesign
//
//  Created by Saboor on 29/02/2024.
//

import SwiftUI

struct AddToCartButton: View {
    var body: some View {
            Button {
                print("add to cart")
            } label: {
                HStack {
                    Image(systemName: "cart")
                    Text("Add to Cart")
                }
            }
            .buttonStyle(BlackButtonStyle())
    }
}

#Preview {
    AddToCartButton()
        .padding()
}
