//
//  PaymentView.swift
//  ShopDesign
//
//  Created by Saboor on 01/03/2024.
//

import SwiftUI

struct PaymentView: View {
    var body: some View {
        VStack {
            Image("creditcard")
                .resizable()
                .scaledToFit()
            Spacer()
        }
        .navigationTitle("Payment Method")
    }
}

#Preview {
    PaymentView()
}
