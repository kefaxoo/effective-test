//
//  Filter.swift
//  effective-test
//
//  Created by Bahdan Piatrouski on 7.06.24.
//

import SwiftUI

enum Filter: Identifiable, CaseIterable {
    case returnDate
    case fromDate
    case personCountFlightClass
    
    var isImage: Bool {
        return switch self {
            case .returnDate, .personCountFlightClass:
                true
            default:
                false
        }
    }
    
    var image: Image {
        return switch self {
            case .returnDate:
                Image(.plus)
            case .personCountFlightClass:
                Image(.personFill)
            default:
                Image("", bundle: .main)
        }
    }
    
    var text: Text {
        return switch self {
            case .returnDate:
                Text("обратно")
                    .foregroundStyle(.white)
            case .fromDate:
                Text("24 фев").foregroundStyle(.white) + Text(", сб").foregroundStyle(.secondaryText)
            case .personCountFlightClass:
                Text("1, эконом")
                    .foregroundStyle(.white)
        }
    }
    
    var shouldStrokeText: Bool {
        return self == .returnDate
    }
    
    var id: String {
        return UUID().uuidString
    }
}
