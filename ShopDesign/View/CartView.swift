//
//  CartView.swift
//  ShopDesign
//
//  Created by Saboor on 28/02/2024.
//

import SwiftUI
import SwiftData

struct CartView: View {
    @Environment(\.dismiss) var dismiss 
    @Query var cartItems : [CartModel]
    var body: some View {
        NavigationStack {
            VStack {
                ScrollView {
                    VStack {
                        ForEach(cartItems,id:\.self) { item in
                        CartProductView(cartItem: item)
                        }
                        Divider()
                        VStack(alignment:.leading) {
                            Text("Shipping Information")
                                .font(.title3)
                                .fontWeight(.semibold)
                            FeeView()
                        }
                        
                    }
                }
                .padding(.top,10)
                .padding(.horizontal)
                Divider()
                CheckoutView()
            }
            .navigationTitle("Bag")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "arrow.left")
                    }
                    .tint(.black)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        print("search")
                    }) {
                        Image(systemName: "magnifyingglass")
                    }
                    .tint(.black)
                }
            }
        }
    }
}

#Preview {
    CartView()
}
