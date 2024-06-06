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
    fileprivate let priceRaw: MusicDestinationPrice
    
    var price: String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        return numberFormatter.string(from: self.priceRaw.value as NSNumber) ?? ""
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
    
    fileprivate init(id: Int, title: String, town: String, price: MusicDestinationPrice) {
        self.id = id
        self.title = title
        self.town = town
        self.priceRaw = price
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
     
        self.id = try container.decode(Int.self, forKey: .id)
        self.title = try container.decode(String.self, forKey: .title)
        self.town = try container.decode(String.self, forKey: .town)
        self.priceRaw = try container.decode(MusicDestinationPrice.self, forKey: .priceRaw)
    }
    
    static var mock: Self {
        return MusicDestination(id: 1, title: "Die Antwoord", town: "Будапешт", price: MusicDestinationPrice(value: 22264))
    }
}

fileprivate struct MusicDestinationPrice: Decodable {
    let value: Int
    
    enum CodingKeys: CodingKey {
        case value
    }
    
    fileprivate init(value: Int) {
        self.value = value
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
     
        self.value = try container.decode(Int.self, forKey: .value)
    }
}
