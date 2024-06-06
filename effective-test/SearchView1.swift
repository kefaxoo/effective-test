//
//  SearchView.swift
//  effective-test
//
//  Created by Bahdan Piatrouski on 6.06.24.
//

import SwiftUI

//struct SearchBarView: View {
//    var body: some View {
//        ZStack {
//            RoundedRectangle(cornerRadius: 16)
//                .fill(Color(uiColor: UIColor(red: 0.18, green: 0.19, blue: 0.21, alpha: 1)).shadow(.drop(color: .black, radius: 4, y: 4)))
//                .frame(height: 96)
//            VStack(alignment: .leading, spacing: 8) {
//                HStack {
//                    Image(systemName: "airplane")
//                        .frame(width: 24, height: 24)
//                    Text("Минск")
//                        .font(.system(size: 16, weight: .semibold))
//                }
//                Rectangle()
//                    .frame(height: 1)
//                    .foregroundStyle(Color(uiColor: UIColor(red: 0.24, green: 0.25, blue: 0.26, alpha: 1)))
//                HStack {
//                    Image(systemName: "magnifyingglass")
//                        .frame(width: 24, height: 24)
//                    Text("Куда - Турция")
//                        .font(.system(size: 16, weight: .semibold))
//                        .foregroundStyle(Color(uiColor: UIColor(red: 0.62, green: 0.62, blue: 0.62, alpha: 1)))
//                }
//            }
//            .padding(16)
//            .padding(16)
//        }
//    }
//}

struct RoundedButton: View {
    let backgroundColor: Color
    let image: Image
    let text: String
    
    var body: some View {
        VStack(spacing: 8) {
            ZStack {
                RoundedRectangle(cornerRadius: 8)
                    .frame(width: 48, height: 48)
                    .foregroundStyle(backgroundColor)
                image
                    .foregroundStyle(.white)
            }
            Text(text)
                .font(.system(size: 14))
                .multilineTextAlignment(.center)
            Spacer()
        }
        .frame(maxWidth: 80)
    }
}

//struct PopularDestination: Identifiable {
//    var id = UUID().uuidString
//    
//    let imageName: String
//    let city: String
//    
//    static let mock = PopularDestination(imageName: "", city: "Стамбул")
//    
//    static let mockArray: [PopularDestination] = [.mock, .mock, .mock]
//}

//struct PopularDestinationView: View {
//    var body: some View {
//        ZStack {
//            RoundedRectangle(cornerRadius: 16)
//                .foregroundStyle(Color(uiColor: UIColor(red: 0.18, green: 0.19, blue: 0.21, alpha: 1)))
//            VStack(spacing: 8) {
//                ForEach(PopularDestination.mockArray) { destination in
//                    HStack(spacing: 8) {
//                        RoundedRectangle(cornerRadius: 8)
//                            .frame(width: 40, height: 40)
//                            .foregroundStyle(.white)
//                        VStack(alignment: .leading) {
//                            Text(destination.city)
//                                .font(.system(size: 16, weight: .semibold))
//                                .foregroundStyle(.white)
//                            Text("Популярное направление")
//                                .font(.system(size: 14))
//                                .foregroundStyle(Color(uiColor: UIColor(red: 0.37, green: 0.37, blue: 0.38, alpha: 1)))
//                        }
//                        Spacer()
//                    }
//                    .padding(.vertical, 8)
//                    Rectangle()
//                        .frame(height: 1)
//                        .foregroundStyle(Color(uiColor: UIColor(red: 0.24, green: 0.25, blue: 0.26, alpha: 1)))
//                }
//            }
//            .padding(16)
//        }
//    }
//}

//struct SearchView: View {
//    var body: some View {
//        ZStack {
//            Color(uiColor: UIColor(red: 0.14, green: 0.15, blue: 0.16, alpha: 1))
//                .ignoresSafeArea()
//            VStack {
//                RoundedRectangle(cornerRadius: 10)
//                    .frame(width: 38, height: 5)
//                    .foregroundStyle(Color(uiColor: UIColor(red: 0.37, green: 0.37, blue: 0.38, alpha: 1)))
//                    .padding(.top, 16)
//                SearchBarView(state: .begin)
//                    .padding(.top, 25)
//                    .padding(.horizontal, 16)
//                HStack() {
//                    RoundedButton(backgroundColor: Color(uiColor: UIColor(red: 0.23, green: 0.39, blue: 0.23, alpha: 1)), image: Image(systemName: "command"), text: "Сложный маршрут")
//                    Spacer()
//                    RoundedButton(backgroundColor: Color(uiColor: UIColor(red: 0.13, green: 0.38, blue: 0.74, alpha: 1)), image: Image(systemName: "globe"), text: "Куда угодно")
//                    Spacer()
//                    RoundedButton(backgroundColor: Color(uiColor: UIColor(red: 0, green: 0.26, blue: 0.49, alpha: 1)), image: Image(systemName: "calendar"), text: "Выходные")
//                    Spacer()
//                    RoundedButton(backgroundColor: Color(uiColor: UIColor(red: 1, green: 0.37, blue: 0.37, alpha: 1)), image: Image(systemName: "flame"), text: "Горячие билеты")
//                }
//                .padding(.top, 26)
//                .padding(.horizontal, 16)
//                PopularDestinationView()
//                    .padding(.top, 26)
//                    .padding(.horizontal, 16)
//                Spacer()
//            }
//        }
//    }
//}
