//
//  CheckoutView.swift
//  ShopDesign
//
//  Created by Saboor on 29/02/2024.
//

import SwiftUI

struct CheckoutView: View {
    var total = 0
    var body: some View {
        HStack(alignment:.center) {
            VStack(alignment:.leading) {
                Text("Total")
                    .font(.title3)
                    .fontWeight(.medium)
                Text("$\(total)")
                    .font(.title)
                    .fontWeight(.semibold)
            }
            Spacer()
            
            Button {
                print("checkout")
            } label: {
                Text("Checkout")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundStyle(Color.white)
                    .frame(width: 150,height: 55)
                    .background(
                        Capsule().fill(Color.black)
                    )
            }

        }
        .padding()
    }
}

#Preview {
    CheckoutView()
        .previewLayout(.sizeThatFits)
}
