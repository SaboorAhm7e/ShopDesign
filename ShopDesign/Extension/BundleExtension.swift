//
//  BundleExtension.swift
//  ShopDesign
//
//  Created by Saboor on 28/02/2024.
//

import Foundation


extension Bundle {
    
    func decode<T: Decodable>(type: T.Type,filename:String) -> T? {
        guard let url = self.url(forResource: filename, withExtension: nil) else {
            fatalError("Failed to locate \(filename) in bundle.")
        }
        guard let data = try? Data(contentsOf: url) else {
            fatalError("failed to load data from bundle")
        }
        let decoder = JSONDecoder()
        do {
            return try decoder.decode(type, from: data)
        } catch {
            print("Error decoding file: \(error)")
            fatalError("failed to decode file")
        }
    }
}
