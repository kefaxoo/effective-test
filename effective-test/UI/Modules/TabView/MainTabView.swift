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
                    Image("Airplane", bundle: .main)
                    Text("Авиабилеты")
                }
        }
    }
}

#Preview {
    MainTabView()
}
