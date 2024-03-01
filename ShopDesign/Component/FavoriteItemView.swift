//
//  FavoriteItemView.swift
//  ShopDesign
//
//  Created by Saboor on 01/03/2024.
//

import SwiftUI

struct FavoriteItemView: View {
    var body: some View {
        VStack {
            Image("yellow")
                .resizable()
                .scaledToFit()
                .frame(width: 150,height: 150)
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.secondary.opacity(0.3))
                }
            VStack(alignment:.leading) {
                Text("Yellow T-Shirt")
                    .font(.title3)
                    .fontWeight(.semibold)
                Text("$100")
                    .font(.title3)
                    .fontWeight(.bold)
            }
        }
    }
}

#Preview {
    FavoriteItemView()
}
