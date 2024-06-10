//
//  Filter.swift
//  effective-test
//
//  Created by Bahdan Piatrouski on 7.06.24.
//

import SwiftUI

enum Filter: Identifiable {
    case returnDate
    case fromDate(date: Date?)
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
        switch self {
            case .returnDate:
                return Text("обратно")
                    .foregroundStyle(.white)
            case .fromDate(let date):
                let date = date ?? Date()
                let dayMonthFormatter = DateFormatter()
                dayMonthFormatter.dateFormat = "dd MMM"
                let weekDayFormatter = DateFormatter()
                weekDayFormatter.dateFormat = "EE"
                return Text(dayMonthFormatter.string(from: date))
                    .foregroundStyle(.white)
                + Text(", \(weekDayFormatter.string(from: date).lowercased())")
                    .foregroundStyle(.secondaryText)
            case .personCountFlightClass:
                return Text("1, эконом")
                    .foregroundStyle(.white)
        }
    }
    
    var shouldStrokeText: Bool {
        return switch self {
            case .returnDate:
                true
            default:
                false
        }
    }
    
    var id: String {
        return UUID().uuidString
    }
}
