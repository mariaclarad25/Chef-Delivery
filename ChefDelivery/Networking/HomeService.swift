//
//  HomeService.swift
//  ChefDelivery
//
//  Created by Maria Clara Dias on 30/06/25.
//

import Foundation

enum RequestError: Error {
    case invalidURL
    case errorRequest(error: String)
}

struct HomeService {
    func fetchData() async throws -> Result<[StoreType], RequestError> {
        guard let url = URL(string: "https://private-dcb9cd-mariaclaradias.apiary-mock.com/home") else {
            return .failure(.invalidURL)
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let (data, _) = try await URLSession.shared.data(for: request)
        let storesObjects = try JSONDecoder().decode([StoreType].self, from: data)
        
        return .success(storesObjects)
    }
    
    func confirmOrder (product: ProductType)  async throws -> Result<[String: Any]?, RequestError> {
        guard let url = URL(string: "https://private-dcb9cd-mariaclaradias.apiary-mock.com/home") else {
            return .failure(.invalidURL)
        }
        
        let encodeObject = try JSONEncoder().encode(product)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = encodeObject
        
        let (data, _) = try await URLSession.shared.data(for: request)
        let message = try JSONSerialization.jsonObject(with: data) as? [String: Any]
        
        return .success(message)
    }
}
