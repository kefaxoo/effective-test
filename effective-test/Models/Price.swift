//
//  Price.swift
//  effective-test
//
//  Created by Bahdan Piatrouski on 7.06.24.
//

import Foundation

struct Price: Decodable {
    let value: Int
    
    var toString: String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        return numberFormatter.string(from: self.value as NSNumber) ?? ""
    }
    
    enum CodingKeys: CodingKey {
        case value
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.value = try container.decode(Int.self, forKey: .value)
    }
}
