//
//  ServicekManager.swift
//  CatsForNick
//
//  Created by Leonardo Saganski on 05/02/25.
//

import UIKit

class ServiceManager: ServiceManagerProtocol {
    func fetch<T: Decodable>(urlString: String) async throws -> T {
        let fullUrlString = "\(Constants.Service.baseUrl)\(urlString)"
        
        guard let url = URL(string: fullUrlString) else {
            throw ServiceError.invalidURL
        }

        var request = URLRequest(url: url)
        request.addValue(Constants.Service.apiKeyValue, forHTTPHeaderField: Constants.Service.apiKeyTitle)
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw ServiceError.invalidResponse
        }
        
        do {
            let decodedResponse = try JSONDecoder().decode(T.self, from: data)
            return decodedResponse
        } catch {
            throw ServiceError.invalidData
        }
    }
}
