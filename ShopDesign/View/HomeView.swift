//
//  HomeView.swift
//  ShopDesign
//
//  Created by Saboor on 28/02/2024.
//

import SwiftUI

struct HomeView: View {
    let categoryArray: [String] = ["Men", "Woman", "Kid"]
    let column: [GridItem] = [
        .init(.flexible()),
        .init(.flexible())
    ]
    var viewModel = ProductViewModel()
    
    var body: some View {
        NavigationView {
            VStack() {
                BannerView()
                
                TestTabView()
                    .frame(height: 80)
                //.padding(.vertical, 5)
                Divider()
                
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVGrid(columns: column) {
                        ForEach(viewModel.products, id: \.name) { product in
                            NavigationLink(destination: DetailView()) {
                                ProductGridView(product: product)
                                    .tint(Color.black)
                                    //.toolbar(.hidden, for: .tabBar)
                            }
                        }
                    }
                    .padding()
                }
                
                Spacer()
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {}) {
                        Image(systemName: "line.3.horizontal")
                    }
                    .tint(Color.black)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {}) {
                        Image(systemName: "magnifyingglass")
                    }
                    .tint(Color.black)
                }
            }
        }
        .onAppear {
            viewModel.loadProducts()
        }
    }
}

#Preview {
    HomeView()
}
