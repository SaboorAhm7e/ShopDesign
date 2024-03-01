//
//  FavoriteView.swift
//  ShopDesign
//
//  Created by Saboor on 28/02/2024.
//

import SwiftUI

struct FavoriteView: View {
    var gridItem : [GridItem] = [
        .init(.flexible()),
        .init(.flexible())
    ]
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                LazyVGrid(columns: gridItem){
                    ForEach(0..<4,id:\.self) { item in
                        FavoriteItemView()
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
