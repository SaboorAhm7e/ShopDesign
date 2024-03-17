//
//  HomeView.swift
//  ShopDesign
//
//  Created by Saboor on 28/02/2024.
//

import SwiftUI
import SwiftData

struct HomeView: View {
    let categoryArray: [String] = ["Men", "Woman", "Kid"]
    let column: [GridItem] = [
        .init(.flexible()),
        .init(.flexible())
    ]
   // var viewModel = ProductViewModel()
    @Query var products : [ProductPersistentModel]
    
    var body: some View {
        NavigationView {
            VStack {
                BannerView()
                    .frame(height:250)
                TestTabView()
                    .frame(height: 50)
                Divider()
                
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVGrid(columns: column) {
                        ForEach(products, id: \.name) { product in
                            NavigationLink(destination: DetailView(product: product)) {
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
            .navigationTitle("Discover")
        }
    }
}

#Preview {
    HomeView()
}
