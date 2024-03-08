//
//  ShopNowView.swift
//  ShopDesign
//
//  Created by Saboor on 06/03/2024.
//

import SwiftUI
import SwiftData

struct ShopNowView: View {
    
    @Environment(\.dismiss) var dismiss
    @State var searchText = ""
    @State var isSearchActive = false
    @Query(sort: [SortDescriptor(\ProductPersistentModel.name)]) var products: [ProductPersistentModel]
    @State var filteredProducts: [ProductPersistentModel] = []
    @State private var showNavigationBar = true
    
    let column : [GridItem] = [
        .init(.flexible()),
        .init(.flexible())
    ]

    var body: some View {
        VStack {
            NavigationView {
                ScrollView(.vertical,showsIndicators:false) {
                    LazyVGrid(columns: column) {
                        ForEach(filteredProducts, id: \.name) { item in
                            ProductGridView(product: item)
                        }
                    }
                    .padding()
                }
                .navigationTitle("ShopNow")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Button {
                            dismiss()
                        } label: {
                            Image(systemName: "chevron.left")
                        }
                        .buttonStyle(.plain)

                    }
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                            isSearchActive.toggle()
                        } label: {
                            Image(systemName: "magnifyingglass")
                        }
                        .buttonStyle(.plain)

                    }
                }
                .searchable(text: $searchText,isPresented : $isSearchActive,placement: .automatic)
               // .navigationBarDrawer(displayMode: .)
                .onChange(of: searchText) { _, new in
                                updateFilteredProducts()
                            }
                .onAppear {
                    updateFilteredProducts()
                }
            }
        }
        .navigationBarHidden(true)
        
    }

    private func updateFilteredProducts() {
        filteredProducts = searchText.isEmpty ? products : products.filter {
            $0.name.localizedStandardContains(searchText)
        }
    }
    
    
}

#Preview {
    ShopNowView()
}
