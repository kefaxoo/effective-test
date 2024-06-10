//
//  SearchButton.swift
//  effective-test
//
//  Created by Bahdan Piatrouski on 10.06.24.
//

import SwiftUI

enum SearchButton: Identifiable, CaseIterable {
    var id: String {
        return UUID().uuidString
    }
    
    case difficultTrip
    case anywhere
    case weekends
    case hotTickets
    
    var backgroundColor: Color {
        return switch self {
            case .difficultTrip:
                .specialGreen
            case .anywhere:
                .anywhere
            case .weekends:
                .weekends
            case .hotTickets:
                .hotTickets
        }
    }
    
    var image: Image {
        return switch self {
            case .difficultTrip:
                Image(.difficultTrip)
            case .anywhere:
                Image(.anywhere)
            case .weekends:
                Image(.weekends)
            case .hotTickets:
                Image(.hotTickets)
        }
    }
    
    var text: String {
        return switch self {
            case .difficultTrip:
                "Сложный маршрут"
            case .anywhere:
                "Куда угодно"
            case .weekends:
                "Выходные"
            case .hotTickets:
                "Горячие билеты"
        }
    }
}
