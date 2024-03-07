//
//  ProductModel.swift
//  ShopDesign
//
//  Created by Saboor on 28/02/2024.
//

import Foundation

struct Product : Codable{
    var name  : String
    var price :  Int
    var coverImage  : String
    var detail : String
    var sizes  : [String]
}
