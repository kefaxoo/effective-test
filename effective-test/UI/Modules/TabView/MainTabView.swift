//
//  TabView.swift
//  effective-test
//
//  Created by Bahdan Piatrouski on 6.06.24.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            TicketsView(viewModel: TicketsViewModel())
                .tabItem {
                    Image(.airplane)
                    Text("Авиабилеты")
                }
            EmptyView()
                .tabItem {
                    Image(.bed)
                    Text("Отели")
                }
            EmptyView()
                .tabItem {
                    Image(.pin)
                    Text("Короче")
                }
            EmptyView()
                .tabItem {
                    Image(.ring)
                    Text("Подписки")
                }
            EmptyView()
                .tabItem {
                    Image(.personTabBar)
                    Text("Профиль")
                }
        }
    }
}

#Preview {
    MainTabView()
}
