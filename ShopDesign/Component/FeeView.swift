//
//  FeeView.swift
//  ShopDesign
//
//  Created by Saboor on 29/02/2024.
//

import SwiftUI

struct FeeView: View {
    var body: some View {
        VStack {
            LabeledContent("Total(2 Items)", value: "$200.0")
            LabeledContent("Shipping Fee", value: "$0.0")
            LabeledContent("Taxes", value: "$0.0")
        }
    }
}

#Preview {
    FeeView()
}
