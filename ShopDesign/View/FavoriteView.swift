//
//  FavoriteView.swift
//  ShopDesign
//
//  Created by Saboor on 28/02/2024.
//

import SwiftUI
import SwiftData

struct FavoriteView: View {
    @Query(filter: #Predicate<ProductPersistentModel> { product in
        product.isFavorite == true
    }) var products : [ProductPersistentModel]
    var gridItem : [GridItem] = [
        .init(.flexible()),
        .init(.flexible())
    ]
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                LazyVGrid(columns: gridItem){
                    ForEach(products,id:\.name) { item in
                        FavoriteItemView(product: item)
                    }
                }
                .padding()
                
            }
            .navigationTitle("Favorites")
        }
    }
}

#Preview {
    FavoriteView()
}
