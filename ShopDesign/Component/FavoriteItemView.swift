//
//  FavoriteItemView.swift
//  ShopDesign
//
//  Created by Saboor on 01/03/2024.
//

import SwiftUI

struct FavoriteItemView: View {
    @Bindable var product : ProductPersistentModel
    var body: some View {
        VStack {
            Image(product.coverImage)
                .resizable()
                .scaledToFit()
                .frame(width: 150,height: 150)
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.secondary.opacity(0.3))
                }
                .overlay(alignment: .topTrailing) {
                    Image(systemName:  "heart.fill")
                        .foregroundStyle(product.isFavorite ? Color.pink : Color.secondary)
                        .offset(x:-5,y:5)
                        .onTapGesture {
                            product.isFavorite.toggle()
                        }
                    
                }
            VStack(alignment:.leading) {
                Text(product.name)
                    .font(.title3)
                    .fontWeight(.semibold)
                Text(product.stringPrice)
                    .font(.title3)
                    .fontWeight(.bold)
            }
        }
    }
}

