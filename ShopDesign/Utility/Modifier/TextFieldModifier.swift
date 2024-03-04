//
//  TextFieldModifier.swift
//  ShopDesign
//
//  Created by Saboor on 02/03/2024.
//

import SwiftUI

struct TextFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.body)
            .fontWeight(.medium)
            .frame(height:50)
            .frame(maxWidth: .infinity)
            .padding(.horizontal,12)
            .keyboardType(.numberPad)
            .background(
            RoundedRectangle(cornerRadius: 8)
                .stroke(lineWidth: 1)
                .foregroundStyle(.secondary)
            )
    }

}
extension View {
    func textFieldStyle() -> some View {
        modifier(TextFieldModifier())
    }
}

