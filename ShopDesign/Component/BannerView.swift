//
//  BannerView.swift
//  ShopDesign
//
//  Created by Saboor on 28/02/2024.
//

import SwiftUI

struct BannerView: View {
    var body: some View {
        VStack(alignment:.leading) {
            Text("Discover")
                .font(.title)
                .fontWeight(.bold)
                .padding()
            
            ZStack(alignment:.bottom) {
               Image("banner")
                    .resizable()
                    .scaledToFill()
                    .frame(height: 250)
                    
                VStack(alignment: .leading) {
                    Text("Brand New Winter\nCollections")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundStyle(Color.white)
                        .shadow(radius: 10)
                    
                    Button {
                        print("shop Now")
                    } label: {
                        HStack {
                            Text("Shop Now")
                            Image(systemName: "arrow.right")
                        }
                        .font(.body)
                        .fontWeight(.semibold)
                        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                       
                    }
                    .tint(Color.white)

                }
                .offset(x:-50,y: -10)
            }
        }

    }
}

#Preview {
    BannerView()
}
