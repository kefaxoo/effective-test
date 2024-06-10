//
//  PopularDestination.swift
//  effective-test
//
//  Created by Bahdan Piatrouski on 7.06.24.
//

import SwiftUI

enum PopularDestination: Identifiable, CaseIterable {
    var id: String {
        return UUID().uuidString
    }
    
    case istanbul
    case sochi
    case phuket
    
    var image: Image {
        return switch self {
            case .istanbul:
                Image(.istanbul)
            case .sochi:
                Image(.sochi)
            case .phuket:
                Image(.phuket)
        }
    }
    
    var name: String {
        return switch self {
            case .istanbul:
                "Стамбул"
            case .sochi:
                "Сочи"
            case .phuket:
                "Пхукет"
        }
    }
}
