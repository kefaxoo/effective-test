//
//  ContentView.swift
//  effective-test
//
//  Created by Bahdan Piatrouski on 6.06.24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
//            TicketsView()
//                .tabItem {
//                    Image(systemName: "airplane")
//                    Text("Авиабилеты")
//                }
//            TicketsView()
//                .tabItem {
//                    Image(systemName: "bed.double.fill")
//                    Text("Отели")
//                }
//            TicketsView()
//                .tabItem {
//                    Image(systemName: "mappin")
//                    Text("Короче")
//                }
//            TicketsView()
//                .tabItem {
//                    Image(systemName: "bell.fill")
//                    Text("Подписки")
//                }
//            TicketsView()
//                .tabItem {
//                    Image(systemName: "person.fill")
//                    Text("Профиль")
//                }
        }
    }
}

struct SearchDestinationView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(uiColor: UIColor(red: 0.18, green: 0.19, blue: 0.21, alpha: 1)))
            ZStack {
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color(uiColor: UIColor(red: 0.24, green: 0.25, blue: 0.26, alpha: 1)).shadow(.drop(color: .black, radius: 4, y: 4)))
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundStyle(Color(uiColor: UIColor(red: 0.86, green: 0.86, blue: 0.86, alpha: 0.6235)))
                        .frame(width: 16, height: 16)
                        .padding(.leading, 12)
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Минск")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundStyle(.white)
                        Rectangle()
                            .frame(height: 1)
                            .foregroundStyle(Color(uiColor: UIColor(red: 0.86, green: 0.86, blue: 0.86, alpha: 0.6235)))
                        Text("Куда - Турция")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundStyle(Color(uiColor: UIColor(red: 0.86, green: 0.86, blue: 0.86, alpha: 0.6235)))
                    }
                    .padding(.leading, 17)
                    .padding(.trailing, 16)
                    .padding(.vertical, 16)
                    Spacer()
                }
            }
            .padding(16)
        }
        .frame(height: 122)
    }
}

struct Destination: Identifiable {
    var id: String = UUID().uuidString
    
    let imageLink: String
    let title: String
    let city: String
    let beginPrice: Int
    
    static let mock = Destination(imageLink: "", title: "Die Antwoord", city: "Будапешт", beginPrice: 22264)
    
    static let mockArray: [Destination] = [.mock, .mock, .mock, .mock]
    
    var formatterBeginPrice: String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.groupingSeparator = " "
        return numberFormatter.string(from: self.beginPrice as NSNumber) ?? ""
    }
}

struct DestinationCollectionView: View {
    let destination: Destination
    
    var body: some View {
        VStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 16)
                .frame(width: 132, height: 132)
            Text(destination.title)
                .font(.system(size: 16, weight: .semibold))
                .padding(.top, 8)
            Text(destination.city)
                .padding(.top, 8)
                .font(.system(size: 14))
            HStack {
                Image(systemName: "airplane")
                    .frame(width: 24, height: 24)
                Text("от \(destination.formatterBeginPrice) ₽")
                    .font(.system(size: 14))
            }
            .padding(.top, 4)
        }
        .frame(maxWidth: 132)
    }
}

//struct TicketsView: View {
//    var body: some View {
//        VStack {
//            Text("Поиск дешевых авиабилетов")
//                .font(.system(size: 22, weight: .semibold))
//                .padding(.top, 26)
//                .padding(.horizontal, 90)
//                .multilineTextAlignment(.center)
//            SearchDestinationView()
//                .padding(.top, 38)
//                .padding(.horizontal, 16)
//            Text("Музыкально отлететь")
//                .font(.system(size: 22, weight: .semibold))
//                .padding(.top, 32)
//                .frame(maxWidth: .infinity, alignment: .leading)
//                .padding(.leading, 16)
//            ScrollView(.horizontal, showsIndicators: false) {
//                HStack(spacing: 67) {
//                    ForEach(Destination.mockArray) { destination in
//                        DestinationCollectionView(destination: destination)
//                    }
//                }
//            }
//            .padding(.top, 10)
//            .contentMargins(16, for: .scrollContent)
//            Spacer()
//        }
//    }
//}

#Preview {
    ContentView()
}
