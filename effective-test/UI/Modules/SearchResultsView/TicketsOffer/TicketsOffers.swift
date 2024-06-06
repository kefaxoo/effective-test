//
//  TicketsOffers.swift
//  effective-test
//
//  Created by Bahdan Piatrouski on 7.06.24.
//

import Foundation

final class TicketsOffers: Decodable {
    let ticketsOffers: [TicketOffer]
    
    enum CodingKeys: String, CodingKey {
        case ticketsOffers = "tickets_offers"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
     
        self.ticketsOffers = try container.decode([TicketOffer].self, forKey: .ticketsOffers)
    }
}

final class TicketOffer: Identifiable, Decodable {
    fileprivate typealias TicketPrice = MusicDestination
    
    let id: Int
    let title: String
    let timeRange: [String]
    fileprivate let priceRaw: Price
    
    var price: String {
        return self.priceRaw.toString
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case timeRange = "time_range"
        case priceRaw = "price"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
     
        self.id = try container.decode(Int.self, forKey: .id)
        self.title = try container.decode(String.self, forKey: .title)
        self.timeRange = try container.decode([String].self, forKey: .timeRange)
        self.priceRaw = try container.decode(Price.self, forKey: .priceRaw)
    }
}
