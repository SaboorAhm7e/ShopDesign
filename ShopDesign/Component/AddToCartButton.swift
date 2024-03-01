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
                .font(.title3)
                .fontWeight(.semibold)
                .foregroundStyle(Color.white)
                .frame(height: 60)
                .frame(maxWidth: .infinity)
                //.padding()
                .background(
                    Capsule().fill(Color.black)
                )
            }
            //.frame(maxWidth:.infinity)
    }
}

#Preview {
    AddToCartButton()
}
