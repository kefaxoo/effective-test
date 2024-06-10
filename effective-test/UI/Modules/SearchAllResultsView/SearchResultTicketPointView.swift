//
//  SearchResultTicketPointView.swift
//  effective-test
//
//  Created by Bahdan Piatrouski on 10.06.24.
//

import SwiftUI

struct SearchResultTicketPointView: View {
    let point: TicketPoint
    
    private var time: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        return dateFormatter.string(from: Date(timeIntervalSince1970: self.point.date))
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(self.time)
                .font(.system(size: 14, weight: .medium))
                .italic()
            Text(self.point.airport)
                .font(.system(size: 14, weight: .medium))
                .italic()
                .foregroundStyle(.secondaryText)
        }
    }
}
