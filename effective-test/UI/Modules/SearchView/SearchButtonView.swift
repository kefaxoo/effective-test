//
//  SearchButtonView.swift
//  effective-test
//
//  Created by Bahdan Piatrouski on 6.06.24.
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
                Color("SpecialGreen", bundle: .main)
            case .anywhere:
                Color("AnywhereColor", bundle: .main)
            case .weekends:
                Color("Weekends", bundle: .main)
            case .hotTickets:
                Color("HotTickets", bundle: .main)
        }
    }
    
    var image: Image {
        return switch self {
            case .difficultTrip:
                Image("DifficultTrip", bundle: .main)
            case .anywhere:
                Image("Anywhere", bundle: .main)
            case .weekends:
                Image("Weekends", bundle: .main)
            case .hotTickets:
                Image("HotTickets", bundle: .main)
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

struct SearchButtonView: View {
    let type: SearchButton
    
    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 8)
                    .foregroundStyle(type.backgroundColor)
                    .frame(width: 48, height: 48)
                type.image
                    .frame(width: 24, height: 24)
            }
            Text(type.text)
                .font(.system(size: 14))
                .multilineTextAlignment(.center)
                .padding(.top, 8)
            Spacer()
        }
        .frame(maxWidth: 80, maxHeight: 110)
    }
}

#Preview {
    SearchButtonView(type: .hotTickets)
}
