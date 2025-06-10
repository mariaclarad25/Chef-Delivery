//
//  Double+.swift
//  ChefDelivery
//
//  Created by Maria Clara Dias on 10/06/25.
//

import Foundation

extension Double {
    func formattedPrice () -> String {
        let formattedString = String (format: "%.2f", self)
        return formattedString.replacingOccurrences(of: ".", with: ",")
    }
}
