//
//  CartProductView.swift
//  ShopDesign
//
//  Created by Saboor on 29/02/2024.
//

import SwiftUI

struct CartProductView: View {
    
    var cartItem : CartModel?
    var body: some View {
        HStack(alignment: .top) {
            Image(cartItem?.item.coverImage ?? "yellow")
                .resizable()
                .scaledToFit()
                .frame(width: 150,height: 150)
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.secondary.opacity(0.3))
                }
            VStack(alignment:.leading) {
                Text("Men's Collection")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
                Text(cartItem?.item.name ?? "Yellow T-Shirt")
                    .font(.title3)
                Spacer()
                    .frame(height:10)
                HStack(spacing:10) {
                    Button {
                        print("minus")
                    } label: {
                        Image(systemName: "minus.square")
                            .font(.system(size: 25))
                            .foregroundStyle(Color.black)
                    }

                    
                    Text("1")
                        .font(.system(size: 25))
                    
                    Button {
                        print("plus")
                    } label: {
                        Image(systemName: "plus.square")
                            .font(.system(size: 25))
                            .foregroundStyle(Color.black)
                    }
                }
                Spacer()
                    .frame(height:20)
                HStack {
                    Button {
                        print("heart")
                    } label: {
                        Image(systemName: "heart")
                            .font(.system(size: 25))
                            .foregroundStyle(Color.black)
                    }
                    Spacer()
                    Text(cartItem?.item.stringPrice ?? "$112")
                        .font(.system(size: 25))
                        .fontWeight(.medium)
                }
               

            }
        }
        //.padding()
    }
}

#Preview {
    CartProductView()
}
