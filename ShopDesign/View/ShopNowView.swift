//
//  ShopNowView.swift
//  ShopDesign
//
//  Created by Saboor on 06/03/2024.
//

import SwiftUI

struct ShopNowView: View {
    
    @Environment(\.dismiss) var dismiss
    @State var searchText = ""
    var column : [GridItem] = [
        .init(.flexible()),
        .init(.flexible())
    ]
    var viewModel = ProductViewModel()
    var body: some View {
        VStack {
            NavigationView {
                ScrollView(.vertical,showsIndicators: false) {
                    LazyVGrid(columns: column, content: {
                        
                        ForEach(viewModel.products,id:\.name) { product in
                            ProductGridView(product: product)
                        }
                    })
                    .padding()
                }
                .searchable(text: $searchText)
                //.navigationBarBackButtonHidden()
                .navigationTitle("Shop Now")
                .toolbar{
                    ToolbarItemGroup(placement: .topBarTrailing) {
                        Image(systemName: "magnifyingglass")
                        Image(systemName: "list.triangle")
                    }
                    ToolbarItem(placement: .topBarLeading) {
                        Button(action: {
                            dismiss()
                        }, label: {
                            Image(systemName: "chevron.left")
                                .tint(.black)
                        })
                    }
                }
            }
            .onAppear {
                viewModel.loadProducts()
            }
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    ShopNowView()
}
