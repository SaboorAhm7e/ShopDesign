//
//  ProductGridView.swift
//  ShopDesign
//
//  Created by Saboor on 28/02/2024.
//

import SwiftUI

struct ProductGridView: View {
    
    var product : Product
    
    var body: some View {
        
        VStack(alignment:.leading) {
            Image(product.coverImage)
                .resizable()
                .scaledToFit()
                .frame(height:200)
                .padding(7)
                .overlay {
                    RoundedRectangle(cornerRadius: 12, style: .continuous)
                        .fill(Color.secondary.opacity(0.5))
                }
            Group {
                Text(product.name)
                Text("$\(product.price)")
            }
            .font(.title3)
            .fontWeight(.medium)
        }
    }
}

#Preview {
    ProductGridView(product: Product(name: "blue", price: 20, coverImage: "blue", description: "abc xyz", sizes: ["S","M","L"]))
}
