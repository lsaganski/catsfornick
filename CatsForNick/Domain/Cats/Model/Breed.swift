//
//  Breed.swift
//  CatsForNick
//
//  Created by Leonardo Saganski on 05/02/25.
//

import Foundation

struct Breed: Decodable {
    var id: String?
    var name: String?
    var temperament: String?
    var origin: String?
    var description: String?
    var life_span: String?
    var alt_names: String?
    var adaptability: Int?
    var affection_level: Int?
    var child_friendly: Int?
    var dog_friendly: Int?
    var energy_level: Int?
    var grooming: Int?
    var health_issues: Int?
    var intelligence: Int?
    var social_needs: Int?
    var stranger_friendly: Int?
    var wikipedia_url: String?
    var weight: Weight?
    
    init(name: String?, origin: String?, description: String?) {
        self.name = name
        self.origin = origin
        self.description = description
    }
}

struct Weight: Decodable {
    let imperial: String?
    let metric: String?
}
