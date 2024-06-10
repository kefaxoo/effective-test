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
     
        self.ticketsOffers = try container.decode(
            [TicketOffer].self,
            forKey: .ticketsOffers
        )
    }
}
