//
//  TestTabView.swift
//  ShopDesign
//
//  Created by Saboor on 03/03/2024.
//

import SwiftUI

struct TestTabView: View {
    @State var currentTab : Int = 0
    var items : [String] = ["Men","Woman","Kids"]
    @Namespace var namespace
    var body: some View {
        VStack {
            ScrollView(.horizontal,showsIndicators: false) {
                HStack(spacing:20) {
                    ForEach(Array(zip(self.items.indices, self.items)), id: \.0) { index,name in
                        TabItemView(namespace: namespace, currentTab: self.$currentTab, tab: index, title: name)
                    }
                }
                .padding(.horizontal)
            }
            .frame(height: 80)
            
            Spacer()
        }
    }
     
}


struct TabItemView : View {
    let namespace : Namespace.ID
    @Binding var currentTab: Int
    var tab: Int
    var title : String
    var body: some View {
        Button {
            self.currentTab = tab
        } label: {
            VStack {
                Spacer()
                Text(title)
                    .foregroundStyle(Color("labelColor"))
                    .fontWeight(currentTab == tab ? .bold : .medium)
                    .animation(.easeInOut(duration: 0.2))
                if currentTab == tab {
                    Color("labelColor")
                        .frame(height: 4)
                        .matchedGeometryEffect(id: "underline", in: namespace,properties: .frame)
                } else {
                    Color.clear.frame(height: 4)
                }
            }
            .animation(.spring(),value: self.currentTab)
        }
        .buttonStyle(.plain)

    }
}


#Preview {
    TestTabView()
}
