//
//  DetailView.swift
//  ShopDesign
//
//  Created by Saboor on 28/02/2024.
//

import SwiftUI

struct DetailView: View {
    @Environment(\.dismiss) var dismiss
    var otherImages : [String] = ["yellow","brown","pink","silver"]
   @Bindable var product : ProductPersistentModel
    var body: some View {
        
        VStack {
            NavigationStack {
                ScrollView(showsIndicators:false) {
                    VStack(alignment: .center) {
                        Image(product.coverImage)
                            .resizable()
                            .scaledToFit()
                            .padding(.bottom,5)
                        
                        ScrollView(.horizontal,showsIndicators: false) {
                            HStack {
                                ForEach(otherImages,id: \.self){ image in
                                    ProductDetailImageView(image: image)
                                }
                                
                                
                            }
                            .padding(.horizontal)
                        }
                        VStack(alignment:.leading) {
                            Text(product.name)
                                .font(.title)
                                .fontWeight(.bold)
                            Text(product.stringPrice)
                                .font(.title)
                                .fontWeight(.semibold)
                            Text(product.detail)
                                .font(.footnote)
                                .foregroundStyle(Color.secondary)
                            Text("Choose Size")
                            HStack {
                                ForEach(product.sizes,id:\.self) { size in
                                    ProductSizeView(text: size)
                                }
                            }
                            NavigationLink(destination: CartView()) {
                                AddToCartButton(product: product)
                                    .padding(.top,20)
                            }
                            
                        }
                        .padding(.horizontal)
                        Spacer()
                        
                        //.frame(height: 100)
                    }
                }
                //.padding()
                .navigationTitle("Casual Wear")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button(action: {
                            dismiss()
                        }) {
                            Image(systemName: "arrow.left")
                        }
                        .tint(Color("labelColor"))
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                            Button {
                                product.isFavorite.toggle()
                            } label: {
                                Image(systemName: "heart.fill")
                                
                            }
                            .tint(product.isFavorite ? Color.pink : Color.secondary)
                    }
                    
                }
            }
            
            
        }
        .navigationBarHidden(true)
        
        
    }
}
