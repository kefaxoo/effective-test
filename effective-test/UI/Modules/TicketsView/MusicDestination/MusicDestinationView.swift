//
//  MusicDestinationView.swift
//  effective-test
//
//  Created by Bahdan Piatrouski on 6.06.24.
//

import SwiftUI

struct MusicDestinationView: View {
    let destination: MusicDestination
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(self.destination.imageName, bundle: .main)
                .resizable()
                .frame(width: 132, height: 132)
            Text(self.destination.title)
                .font(.system(size: 16, weight: .semibold))
                .padding(.top, 8)
            Text(self.destination.town)
                .font(.system(size: 14))
                .padding(.top, 8)
            HStack {
                Image(.airplane)
                    .frame(width: 24, height: 24)
                    .foregroundStyle(.secondaryText)
                Text("от \(destination.price) ₽")
                    .font(.system(size: 14))
            }
        }
        .frame(width: 132)
    }
}
