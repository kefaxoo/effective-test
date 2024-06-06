//
//  SearchResultsView.swift
//  effective-test
//
//  Created by Bahdan Piatrouski on 6.06.24.
//

import SwiftUI

struct SearchResultsBarView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .foregroundStyle(Color(uiColor: UIColor(red: 0.18, green: 0.19, blue: 0.21, alpha: 1)))
            HStack(spacing: 8) {
                Image(systemName: "arrow.left")
                    .frame(width: 24, height: 24)
                VStack(alignment: .leading) {
                    HStack {
                        Text("Минск")
                            .font(.system(size: 16, weight: .semibold))
                        Spacer()
                        Image(systemName: "arrow.up.arrow.down")
                            .frame(width: 24, height: 24)
                    }
                    Rectangle()
                        .frame(height: 1)
                        .foregroundStyle(Color(uiColor: UIColor(red: 0.24, green: 0.25, blue: 0.26, alpha: 1)))
                    HStack {
                        Text("Сочи")
                            .font(.system(size: 16, weight: .semibold))
                        Spacer()
                        Image(systemName: "xmark")
                            .frame(width: 24, height: 24)
                    }
                }
            }
            .padding(.leading, 8)
            .padding(.trailing, 16)
            .padding(.vertical, 16)
        }
        .frame(height: 96)
    }
}

enum Filters: Identifiable {
    enum FlightType {
        case economy
        case business
        
        var title: String {
            return switch self {
                case .economy:
                    "эконом"
                case .business:
                    "бизнес"
            }
        }
    }
    
    case backDate(date: Date?)
    case beginDate(date: Date)
    case info(countOfPassengers: Int, flightType: Filters.FlightType)
    
    static var allCases: [Filters] {
        return [.backDate(date: nil), .beginDate(date: Date()), .info(countOfPassengers: 1, flightType: .economy)]
    }
    
    var title: Text {
        switch self {
            case .backDate(let date):
                if let date {
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "dd MMM"
                    let dateString = dateFormatter.string(from: date)
                    
                    dateFormatter.dateFormat = "EE"
                    let dayString = dateFormatter.string(from: date)
                    
                    return Text(dateString).foregroundStyle(.white) + Text(", ").foregroundStyle(Color(uiColor: UIColor(red: 0.62, green: 0.62, blue: 0.62, alpha: 1))) + Text(dayString).foregroundStyle(Color(uiColor: UIColor(red: 0.62, green: 0.62, blue: 0.62, alpha: 1)))
                } else {
                    return Text("обратно")
                }
            case .beginDate(let date):
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "dd MMM"
                let dateString = dateFormatter.string(from: date)
                
                dateFormatter.dateFormat = "EE"
                let dayString = dateFormatter.string(from: date)
                
                return Text(dateString).foregroundStyle(.white) + Text(", ").foregroundStyle(Color(uiColor: UIColor(red: 0.62, green: 0.62, blue: 0.62, alpha: 1))) + Text(dayString).foregroundStyle(Color(uiColor: UIColor(red: 0.62, green: 0.62, blue: 0.62, alpha: 1)))
            case .info(let countOfPassengers, let flightType):
                return Text("\(countOfPassengers), \(flightType.title)")
        }
    }
    
    var image: Image? {
        switch self {
            case .backDate(let date):
                guard date == nil else { return nil }
                
                return Image(systemName: "plus")
            case .beginDate:
                return nil
            case .info:
                return Image(systemName: "person.fill")
        }
    }
    
    var id: String {
        return UUID().uuidString
    }
}

//struct FilterView: View {
//    let filter: Filters
//    
//    var body: some View {
//        ZStack {
//            RoundedRectangle(cornerRadius: 50)
//                .foregroundStyle(Color(uiColor: UIColor(red: 0.18, green: 0.19, blue: 0.21, alpha: 1)))
//            HStack(spacing: 8) {
//                if let image = filter.image {
//                    image
//                        .frame(width: 16, height: 16)
//                }
//                filter.title.font(.system(size: 14, weight: .medium)).italic()
//            }
//            .padding(.horizontal, 10)
//            .padding(.vertical, 8.5)
//        }
//        .frame(height: 33)
//    }
//}

//struct SearchResultsView: View {
//    @State private var subscriptionOnPrice = false
//    
//    var body: some View {
//        VStack {
//            SearchResultsBarView()
//                .padding(.top, 47)
//                .padding(.horizontal, 16)
//            ScrollView(.horizontal, showsIndicators: false) {
//                HStack(spacing: 8) {
//                    ForEach(Filters.allCases) { filter in
//                        FilterView(filter: filter)
//                    }
//                }
//            }
//            .contentMargins(16, for: .scrollContent)
//            ZStack {
//                RoundedRectangle(cornerRadius: 16)
//                    .foregroundStyle(Color(uiColor: UIColor(red: 0.11, green: 0.12, blue: 0.13, alpha: 1)))
//                VStack(alignment: .leading) {
//                    Text("Прямые рейсы")
//                        .font(.system(size: 20, weight: .semibold))
//                        .multilineTextAlignment(.leading)
//                        .padding(.top, 16)
//                        .padding(.leading, 16)
//                    Spacer()
//                    
//                }
//            }
//            .padding(.horizontal, 16)
//            .padding(.bottom, 18)
//            Spacer()
//            ZStack {
//                RoundedRectangle(cornerRadius: 8)
//                    .foregroundStyle(Color(uiColor: UIColor(red: 0.13, green: 0.38, blue: 0.74, alpha: 1)))
//                Text("Посмотреть все билеты")
//                    .font(.system(size: 16, weight: .semibold))
//                    .italic()
//            }
//            .frame(height: 42)
//            .padding(.horizontal, 16)
//            .padding(.bottom, 24)
//            ZStack {
//                RoundedRectangle(cornerRadius: 8)
//                    .frame(height: 51)
//                    .foregroundStyle(Color(uiColor: UIColor(red: 0.14, green: 0.15, blue: 0.16, alpha: 1)))
//                HStack {
//                    Image(systemName: "bell.fill")
//                        .frame(width: 24, height: 24)
//                        .foregroundStyle(Color(uiColor: UIColor(red: 0.13, green: 0.38, blue: 0.74, alpha: 1)))
//                    Text("Подписка на цену")
//                        .padding(.leading, 8)
//                        .font(.system(size: 16))
//                    Spacer()
//                    Toggle(isOn: $subscriptionOnPrice) {
//                        Text("")
//                    }
//                }
//                .padding(.horizontal, 16)
//                .padding(.vertical, 14)
//            }
//            .padding(.horizontal, 16)
//            .padding(.bottom, 39)
//        }
//    }
//}
