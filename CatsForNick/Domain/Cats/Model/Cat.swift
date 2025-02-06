//
//  Cat.swift
//  CatsForNick
//
//  Created by Leonardo Saganski on 05/02/25.
//

import Foundation

struct Cat: Decodable, Identifiable {
    var id: String?
    var url: String?
    var width: Int
    var height: Int?
    var breeds: [Breed]?
}
