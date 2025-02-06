//
//  Constants.swift
//  CatsForNick
//
//  Created by Leonardo Saganski on 05/02/25.
//

import Foundation

struct Constants {
    struct Service {
        static let numberOfResults = 20
        static let baseUrl = "https://api.thecatapi.com/v1"
        static let imageSearch = "/images/search?size=med&mime_types=jpg&format=json&has_breeds=true&order=ASC&page=%d&limit=%d"
        static let apiKeyTitle = "x-api-key"
        static let apiKeyValue = "live_gIaN73bvC5MjxalKwLGF0N2tFUpvUaPym39CV8IhApKD4HvnP9atvhXzO2MsUIUi"
    }
    
    struct ErrorMessage {
        static let invalidURL = "Invalid url."
        static let invalidResponse = "Invalid response from server."
        static let invalidData = "Invalid data from server."
    }
    
    struct Testing {
        static let catList = "CAT_LIST"
        static let description = "CAT_DESCRIPTION"
    }
}
