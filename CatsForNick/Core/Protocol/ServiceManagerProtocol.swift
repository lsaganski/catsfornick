//
//  ServiceManagerProtocol.swift
//  CatsForNick
//
//  Created by Leonardo Saganski on 05/02/25.
//

import UIKit

protocol ServiceManagerProtocol {
    func fetch<T: Decodable>(urlString: String) async throws -> T
}
