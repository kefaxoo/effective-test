//
//  FilterView.swift
//  effective-test
//
//  Created by Bahdan Piatrouski on 7.06.24.
//

import SwiftUI

struct FilterView: View {
    let filter: Filter
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 50)
                .foregroundStyle(.greySearchBar)
            HStack(spacing: 8) {
                if self.filter.isImage {
                    filter.image
                        .frame(width: 16, height: 16)
                }
                if self.filter.shouldStrokeText {
                    filter.text
                        .italic()
                        .shadow(color: .black, radius: 1)
                } else {
                    filter.text
                        .italic()
                }
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 8.5)
        }
        .frame(height: 33)
    }
}

#Preview {
    FilterView(filter: .returnDate)
}
