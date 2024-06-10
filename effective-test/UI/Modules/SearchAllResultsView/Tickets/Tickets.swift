//
//  Tickets.swift
//  effective-test
//
//  Created by Bahdan Piatrouski on 9.06.24.
//

import Foundation

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
