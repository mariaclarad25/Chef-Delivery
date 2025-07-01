//
//  ProductType.swift
//  ChefDelivery
//
//  Created by Maria Clara Dias on 09/06/25.
//

import Foundation

struct ProductType: Identifiable, Codable {
    let id: Int
    let name: String
    let description: String
    let image: String
    let price: Double
    
    var formattedPrice: String {
        return "R$" + price.formattedPrice()
    }
}
