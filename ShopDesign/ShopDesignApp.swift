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
        .modelContainer(for: ProductPersistentModel.self) { result in
            do {
                let container = try result.get()
               
                // Load and decode the JSON.
                guard let url = Bundle.main.url(forResource: "products", withExtension: "json") else {
                    fatalError("Failed to find users.json")
                }
                let data = try Data(contentsOf: url)
                let users = try JSONDecoder().decode([ProductPersistentModel].self, from: data)
                // Add all our data to the context.
                for user in users {
                    container.mainContext.insert(user)
                }
            } catch {
                print("Failed to pre-seed database.")
            }
            
        }
    }
}
