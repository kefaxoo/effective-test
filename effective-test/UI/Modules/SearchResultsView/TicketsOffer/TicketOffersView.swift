//
//  TicketOffersView.swift
//  effective-test
//
//  Created by Bahdan Piatrouski on 7.06.24.
//

import SwiftUI

struct TicketOffersView: View {
    let index: Int
    let ticketOffer: TicketOffer
    
    private var color: Color {
        return switch self.index {
            case 0:
                .hotTickets
            case 1:
                .anywhere
            case 2:
                .white
            default:
                .clear
        }
    }
    
    var body: some View {
        HStack(alignment: .top) {
            RoundedRectangle(cornerRadius: 12)
                .foregroundStyle(color)
                .frame(width: 24, height: 24)
                .padding(.top, 8)
            VStack {
                HStack {
                    Text(self.ticketOffer.title)
                        .font(.system(size: 14, weight: .medium))
                        .italic()
                    Spacer()
                    Text("\(self.ticketOffer.price) ₽")
                        .font(.system(size: 14, weight: .medium))
                        .foregroundStyle(.anywhere)
                    Image(.chevronRight)
                        .frame(width: 16, height: 16)
                }
                Text(self.ticketOffer.timeRange.joined(separator: " "))
                    .font(.system(size: 14))
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.leading, 8)
            .padding(.top, 8)
            .padding(.bottom, 10)
            Spacer()
        }
    }
}
