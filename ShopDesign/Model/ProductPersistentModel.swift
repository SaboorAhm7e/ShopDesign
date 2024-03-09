//
//  ProductPersistentModel.swift
//  ShopDesign
//
//  Created by Saboor on 07/03/2024.
//

import Foundation
import SwiftData

@Model
class ProductPersistentModel : Codable {
    
    
    
    enum CodingKeys : CodingKey {
        case name
        case price
        case coverImage
        case detail
        case sizes
    }
    
    var name  : String
    var price :  Int
    var coverImage  : String
    var detail : String
    var sizes  : [String]
    var isFavorite : Bool = false
    var isCartItem : Bool = false
    var stringPrice : String {
        return "$\(price)"
    }
  
    
    init(name: String, price: Int, coverImage: String, detail: String, sizes: [String], isFavorite: Bool, isCartItem: Bool) {
        self.name = name
        self.price = price
        self.coverImage = coverImage
        self.detail = detail
        self.sizes = sizes
        self.isFavorite = isFavorite
        self.isCartItem = isCartItem
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.price = try container.decode(Int.self, forKey: .price)
        self.coverImage = try container.decode(String.self, forKey: .coverImage)
        self.detail = try container.decode(String.self, forKey: .detail)
        self.sizes = try container.decode([String].self, forKey: .sizes)
        
       }

       func encode(to encoder: Encoder) throws {
           var container = encoder.container(keyedBy: CodingKeys.self)
           try container.encode(name, forKey: .name)
       }
}

