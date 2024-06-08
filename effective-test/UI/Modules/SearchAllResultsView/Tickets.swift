//
//  Tickets.swift
//  effective-test
//
//  Created by Bahdan Piatrouski on 9.06.24.
//

import Foundation

// 2024-02-23T03:15:00

struct Tickets: Decodable {
    let tickets: [Ticket]
    
    enum CodingKeys: CodingKey {
        case tickets
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
     
        self.tickets = try container.decode([Ticket].self, forKey: .tickets)
    }
}

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

struct TicketPoint: Decodable {
    fileprivate let dateRaw: String
    
    var date: TimeInterval {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        return dateFormatter.date(from: self.dateRaw)?.timeIntervalSince1970 ?? 0
    }
    
    let airport: String
    
    enum CodingKeys: String, CodingKey {
        case dateRaw = "date"
        case airport
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
     
        self.dateRaw = try container.decode(String.self, forKey: .dateRaw)
        self.airport = try container.decode(String.self, forKey: .airport)
    }
}
