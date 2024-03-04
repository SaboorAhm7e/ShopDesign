//
//  PaymentView.swift
//  ShopDesign
//
//  Created by Saboor on 01/03/2024.
//

import SwiftUI

struct PaymentView: View {
    @State private var testi = ""
    @State private var cardNo : String = ""
    @State private var cvc : String = ""
    @State private var expiryDate : String = ""
    var body: some View {
        VStack {
            Image("card")
                .resizable()
                .scaledToFit()
            
            VStack(spacing: 20) {
                
                TextField("XXXX XXXX XXXX XXXX", text: $cardNo)
                    .textFieldStyle()
                    .onChange(of: cardNo, { _ , newValue in
                                    cardNo = formatedCreditCardNumber(number: newValue)
                                })
                HStack {
                    TextField("YY/MM", text: $expiryDate)
                        .textFieldStyle()
                                    .onChange(of: expiryDate, { _ , newValue in
                                        expiryDate = formattedExpirationDate(date: newValue)
                                    })
                    TextField("CVC/CVV",text: $cvc)
                        .textFieldStyle()
                        .onChange(of: cvc) { _ , newValue in
                            let stripped = newValue.filter { $0.isNumber}
                            cvc = String(stripped.prefix(3))
                        }
                }
                
                Button {
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                } label: {
                    Text("Add Card")
                }
                .buttonStyle(BlackButtonStyle())

                
                                
            }
            .padding()
                
            Spacer()
        }
        .navigationTitle("Payment Method")
    }
    func formatedCreditCardNumber(number : String) -> String {
        let strippedNumber = number.filter{$0.isNumber}
        let formatedNumber = strippedNumber.prefix(16).enumerated().map { index, char in
            index > 0 && index % 4 == 0 ? " \(char)" : String(char)
        }.joined()
        return formatedNumber
    }
    func formattedExpirationDate(date : String) -> String {
        let strippedNumber = date.filter { $0.isNumber }
        if strippedNumber.count > 4 {
            return String(strippedNumber.prefix(4))
        } else if strippedNumber.count >= 3 {
            let year = strippedNumber.prefix(2)
            let month = strippedNumber.suffix(2)
            let formattedMonth = min(Int(month) ?? 1,12)
            return "\(year)/\(formattedMonth)"
            
        } else {
            return strippedNumber
        }
    }
}

#Preview {
    PaymentView()
}
