//
//  PopularDestinationView.swift
//  effective-test
//
//  Created by Bahdan Piatrouski on 6.06.24.
//

import SwiftUI

struct PopularDestinationView: View {
    let type: PopularDestination
    
    var body: some View {
        HStack {
            type.image
                .frame(width: 40, height: 40)
            VStack(alignment: .leading) {
                Text(type.name)
                    .font(.system(size: 16, weight: .semibold))
                Spacer()
                Text("Популярное направление")
                    .font(.system(size: 14))
                    .foregroundStyle(.dismiss)
            }
            .frame(height: 40)
            .padding(.leading, 8)
            Spacer()
        }
        .padding(.vertical, 8)
        .padding(.horizontal, 16)
    }
}

#Preview {
    PopularDestinationView(type: .istanbul)
}
