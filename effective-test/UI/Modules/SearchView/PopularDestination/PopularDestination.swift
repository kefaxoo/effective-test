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
                Image("Istanbul", bundle: .main)
            case .sochi:
                Image("Sochi", bundle: .main)
            case .phuket:
                Image("Phuket", bundle: .main)
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
