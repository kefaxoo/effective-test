//
//  MusicDestinationOffers.swift
//  effective-test
//
//  Created by Bahdan Piatrouski on 10.06.24.
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
