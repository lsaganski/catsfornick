//
//  ServiceManagerMock.swift
//  CatsForNick
//
//  Created by Leonardo Saganski on 06/02/25.
//

import Foundation

class ServiceManagerMock: ServiceManagerProtocol {
    func fetch<T: Decodable>(urlString: String) async throws -> T {
        guard let data = JSONHelper().readJSONFile(name: "CatMock.json") else {
            throw ServiceError.invalidData
        }
        
        do {
            let decodedResponse = try JSONDecoder().decode(T.self, from: data)
            return decodedResponse
        } catch {
            throw ServiceError.invalidData
        }
    }
}
