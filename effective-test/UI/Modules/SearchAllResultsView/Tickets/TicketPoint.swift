//
//  TicketPoint.swift
//  effective-test
//
//  Created by Bahdan Piatrouski on 10.06.24.
//

import Foundation

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
