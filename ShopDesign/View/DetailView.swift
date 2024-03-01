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
    var body: some View {
        
        VStack {
            NavigationStack {
                ScrollView(showsIndicators:false) {
                VStack(alignment: .center) {
                    Image("blue")
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
                        Text("Blue T-Shirt")
                            .font(.title)
                            .fontWeight(.bold)
                        Text("$100")
                            .font(.title)
                            .fontWeight(.semibold)
                        Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")
                            .font(.footnote)
                            .foregroundStyle(Color.secondary)
                        Text("Choose Size")
                        HStack {
                            ProductSizeView(text: "S")
                            ProductSizeView(text: "M")
                            ProductSizeView(text: "L")
                        }
                        NavigationLink(destination: CartView()) {
                            AddToCartButton()
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
