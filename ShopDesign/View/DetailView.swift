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
    var product : ProductPersistentModel?
    var body: some View {
        
        VStack {
            NavigationStack {
                ScrollView(showsIndicators:false) {
                VStack(alignment: .center) {
                    Image(product?.coverImage ?? "blue")
                        .resizable()
                        .scaledToFit()
                    //.frame(height:200)
                    //.padding(.top,10)
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
                        Text(product?.name ?? "Blue T-Shirt")
                            .font(.title)
                            .fontWeight(.bold)
                        Text(product?.stringPrice ?? "$0")
                            .font(.title)
                            .fontWeight(.semibold)
                        Text(product?.detail ?? "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")
                            .font(.footnote)
                            .foregroundStyle(Color.secondary)
                        Text("Choose Size")
                        HStack {
                            ForEach(product?.sizes ?? ["M"],id:\.self) { size in
                                ProductSizeView(text: size)
                            }
                        }
                        NavigationLink(destination: CartView()) {
                            AddToCartButton(product: product!)
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
        
        .navigationBarHidden(true)
        
        
    }
}
#Preview {
    DetailView()
}
