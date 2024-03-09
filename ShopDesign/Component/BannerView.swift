//
//  BannerView.swift
//  ShopDesign
//
//  Created by Saboor on 28/02/2024.
//

import SwiftUI

struct BannerView: View {
    @State private var sortDescriptor = SortDescriptor(\ProductPersistentModel.name)
    var bannerImages : [String] = [
        "bannerImage1",
        "bannerImage2",
        "bannerImage3",
        "bannerImage4",
    ]
    var body: some View {
        TabView {
            ForEach(bannerImages,id:\.self) { banner in
                Image(banner)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 250)
            }
        }
        .tabViewStyle(.page)
        .overlay(
            NavigationLink {
                ShopNowView()
                
            } label: {
                HStack {
                    Image(systemName: "arrow.right")
                }
                .font(.body)
                .fontWeight(.semibold)
                .foregroundStyle(Color.white)
                .padding()
                .background(.ultraThinMaterial)
                .clipShape(Circle())
                .shadow(radius: 10)
                .offset(x:-10,y:-25)
            }
            ,alignment: .bottomTrailing
        )
        
    }
}

#Preview {
    BannerView()
        .preferredColorScheme(.dark)
}
