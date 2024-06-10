//
//  SearchButtonView.swift
//  effective-test
//
//  Created by Bahdan Piatrouski on 6.06.24.
//

import SwiftUI

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
