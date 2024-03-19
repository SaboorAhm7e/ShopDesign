//
//  CartProductView.swift
//  ShopDesign
//
//  Created by Saboor on 29/02/2024.
//

import SwiftUI

struct CartProductView: View {
    
    @Bindable var cartItem : CartModel
    var body: some View {
        HStack(alignment: .top) {
            Image(cartItem.item.coverImage)
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
                Text(cartItem.item.name)
                    .font(.title3)
                Spacer()
                    .frame(height:10)
                HStack(spacing:10) {
                    Button {
                        deccrement()
                    } label: {
                        Image(systemName: "minus.square")
                            .font(.system(size: 25))
                            .foregroundStyle(Color.black)
                    }

                    
                    Text("\(cartItem.quantity)")
                        .font(.system(size: 25))
                    
                    Button {
                        increment()
                    } label: {
                        Image(systemName: "plus.square")
                            .font(.system(size: 25))
                            .foregroundStyle(Color.black)
                    }
                }
                Spacer()
                    .frame(height:20)
                HStack {
                    
                    Text("$\(cartItem.item.price * cartItem.quantity)")
                        .font(.system(size: 25))
                        .fontWeight(.medium)
                    Spacer()
                }
               

            }
        }
        //.padding()
    }
    
    // MARK: - Fuctions
    func increment() {
        if cartItem.quantity == 5 {
            
        } else {
            cartItem.quantity += 1
        }
    }
    func deccrement() {
        if cartItem.quantity == 1 {
            
        } else {
            cartItem.quantity -= 1
        }
    }
}
