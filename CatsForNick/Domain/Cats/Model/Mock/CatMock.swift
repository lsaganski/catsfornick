//
//  CatMock.swift
//  CatsForNick
//
//  Created by Leonardo Saganski on 06/02/25.
//

import Foundation

struct CatMock {
    static let sample = Cat(id: "123",
                            url: "https://cdn2.thecatapi.com/images/4-5SzDNIL.jpg",
                            width: 880,
                            height: 1100,
                            breeds: [Breed(name: "Arabian Mau",
                                           origin: "United Arab Emirates",
                                           description: "Bengals are a lot of fun to live with, but they're definitely not the cat for everyone, or for first-time cat owners. Extremely intelligent, curious and active, they demand a lot of interaction and woe betide the owner who doesn't provide it.")])
    
    static let sampleList: [Cat] = [sample, sample, sample, sample, sample, sample, sample, sample]
}
