//
//  StoreFile.swift
//  ChefDelivery
//
//  Created by Maria Clara Dias on 09/06/25.
//

import Foundation

struct StoreType: Identifiable {
    let id: Int
    let name: String
    let logoImage: String
    let headerImage: String
    let location: String
    let stars: Int
    let distance: Double
    let products: [ProductType]
}
