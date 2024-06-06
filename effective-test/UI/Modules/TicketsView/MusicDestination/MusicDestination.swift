//
//  MusicDestination.swift
//  effective-test
//
//  Created by Bahdan Piatrouski on 6.06.24.
//

import Foundation

struct MusicDestinationOffers: Decodable {
    let offers: [MusicDestination]
    
    enum CodingKeys: CodingKey {
        case offers
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
      
        self.offers = try container.decode([MusicDestination].self, forKey: .offers)
    }
}

struct MusicDestination: Decodable, Identifiable {
    let id: Int
    let title: String
    let town: String
    fileprivate let priceRaw: Price
    
    var price: String {
        return self.priceRaw.toString
    }
    
    var imageName: String {
        return "MusicDestination\(self.id)"
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case town
        case priceRaw = "price"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
     
        self.id = try container.decode(Int.self, forKey: .id)
        self.title = try container.decode(String.self, forKey: .title)
        self.town = try container.decode(String.self, forKey: .town)
        self.priceRaw = try container.decode(Price.self, forKey: .priceRaw)
    }
}
