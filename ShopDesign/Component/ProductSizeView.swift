//
//  ProductSizeView.swift
//  ShopDesign
//
//  Created by Saboor on 29/02/2024.
//

import SwiftUI

struct ProductSizeView: View {
    var text : String = "S"
    var body: some View {
        Text(text)
            .frame(width:30,height: 30)
            .overlay {
                Circle().stroke(lineWidth: 1)
            }
    }
}

#Preview {
    ProductSizeView()
}
