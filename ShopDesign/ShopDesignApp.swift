//
//  ShopDesignApp.swift
//  ShopDesign
//
//  Created by Saboor on 28/02/2024.
//

import SwiftUI
import SwiftData

@main
struct ShopDesignApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
       // .modelContainer(for: )
        .modelContainer(for: [ProductPersistentModel.self,CartModel.self]) { result in
            do {
                let container = try result.get()
                
                // Check if the data already exists in the context.
                let fetchDescriptor = FetchDescriptor<ProductPersistentModel>()
                
                let products = try container.mainContext.fetch(fetchDescriptor)
                if products.count == 0 {
                    // Load and decode the JSON.
                    guard let url = Bundle.main.url(forResource: "products", withExtension: "json") else {
                        fatalError("Failed to find products.json")
                    }
                    let data = try Data(contentsOf: url)
                    let products = try JSONDecoder().decode([ProductPersistentModel].self, from: data)
                    // Add all our data to the context.
                    for product in products {
                        container.mainContext.insert(product)
                    }
                }
            } catch {
                print("Failed to pre-seed database.")
            }
            
        }
        
    }
}
