//
//  ProfileView.swift
//  ShopDesign
//
//  Created by Saboor on 28/02/2024.
//

import SwiftUI

struct ProfileView: View {
    
    @State private var isImageShowing : Bool = false
    @State private var isCircleFilled : Bool = false
    
    var body: some View {
        NavigationStack {
        VStack {
            ZStack {
                Image("profile")
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .opacity(isImageShowing ? 1 : 0)
                    .animation(.easeInOut, value: isImageShowing)
                Circle()
                    .stroke(lineWidth: 10)
                    .foregroundStyle(Color.secondary.opacity(0.3))
                Circle()
                    .trim(from: 0,to: isCircleFilled ? 1 : 0)
                    .rotation(.degrees(-90))
                    .stroke(style: StrokeStyle(lineWidth: 10,lineCap: .round))
                    .foregroundStyle(Color.teal)
                    .animation(.easeInOut(duration: 2), value: isCircleFilled)
            }
            .frame(width: 200,height: 200)
            .shadow(color: .gray.opacity(0.5), radius: 30)
            
            Text("Saboor Ahmad")
                .font(.largeTitle)
                .fontWeight(.bold)
                .fontDesign(.rounded)
            Text("Software Engineer - iOS")
                .font(.title3)
                .fontWeight(.bold)
                .foregroundStyle(Color.secondary)
            
            List {
                
                
                Section("About") {
                    LabeledContent("Education", value: "MCS")
                        .listRowBackground(Color.gray.opacity(0.2))
                    LabeledContent("Experience", value: "2 Years")
                        .listRowBackground(Color.gray.opacity(0.2))
                    DisclosureGroup("Languages") {
                        LabeledContent("English", value: "Elemetry")
                        LabeledContent("Urdu", value: "Native")
                    }
                    .listRowBackground(Color.gray.opacity(0.2))
                }
                
                
                Section("Settings") {
                HStack {
                    Text("Appearance")
                    Spacer()
                    Button {
                        print("appear")
                    } label: {
                        Image(systemName: "sun.max.fill")
                            .font(.system(size: 24))
                    }
                    
                    
                    
                }
                .listRowBackground(Color.gray.opacity(0.2))
                HStack {
                    NavigationLink {
                        PaymentView()
                    } label: {
                        Text("Payment")
                    }
                    
                    
                }
                .listRowBackground(Color.gray.opacity(0.2))
            }
               
            }
            .scrollContentBackground(.hidden)
            
            Spacer()
            
        }
        .navigationBarHidden(true)
    }
        .onAppear {
            withAnimation(.easeInOut(duration: 2)) {
                isCircleFilled = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    isImageShowing = true
                }
                
            }
        }
        
        
    }
}
#Preview {
    ProfileView()
}
