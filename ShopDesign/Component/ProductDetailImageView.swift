//
//  ProductDetailImageView.swift
//  ShopDesign
//
//  Created by Saboor on 29/02/2024.
//

import SwiftUI

struct ProductDetailImageView: View {
    var image : String = "yellow"
    var body: some View {
        Image(image)
            .resizable()
            .scaledToFit()
            .frame(width:150,height: 150)
            .overlay {
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color.secondary.opacity(0.3))
            }
            //.padding()
    }
}

#Preview {
    ProductDetailImageView()
}
