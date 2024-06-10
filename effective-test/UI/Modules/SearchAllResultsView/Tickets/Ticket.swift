//
//  Ticket.swift
//  effective-test
//
//  Created by Bahdan Piatrouski on 10.06.24.
//

import Foundation

struct Ticket: Identifiable, Decodable {
    let id: Int
    let badge: String?
    fileprivate let priceRaw: Price
    var price: String {
        return self.priceRaw.toString
    }
    
    let departure: TicketPoint
    let arrival: TicketPoint
    let hasTransfer: Bool
    
    enum CodingKeys: String, CodingKey {
        case id
        case badge
        case priceRaw = "price"
        case departure
        case arrival
        case hasTransfer = "has_transfer"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
     
        self.id = try container.decode(Int.self, forKey: .id)
        self.badge = try container.decodeIfPresent(String.self, forKey: .badge)
        self.priceRaw = try container.decode(Price.self, forKey: .priceRaw)
        self.departure = try container.decode(TicketPoint.self, forKey: .departure)
        self.arrival = try container.decode(TicketPoint.self, forKey: .arrival)
        self.hasTransfer = try container.decode(Bool.self, forKey: .hasTransfer)
    }
}
