//
//  ServiceError.swift
//  CatsForNick
//
//  Created by Leonardo Saganski on 06/02/25.
//

import Foundation

enum ServiceError: Error {
    case invalidURL, invalidResponse, invalidData
}
