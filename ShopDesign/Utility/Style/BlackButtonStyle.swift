//
//  BlackButtonStyle.swift
//  ShopDesign
//
//  Created by Saboor on 02/03/2024.
//

import SwiftUI


struct BlackButtonStyle : ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.title3)
            .fontWeight(.semibold)
            .foregroundStyle(Color.white)
            .frame(height: 60)
            .frame(maxWidth: .infinity)
            .background(
                Capsule().fill(Color("buttonColor"))
                )
    }
}
