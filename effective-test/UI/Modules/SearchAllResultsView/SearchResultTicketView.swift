//
//  SearchResultTicketView.swift
//  effective-test
//
//  Created by Bahdan Piatrouski on 8.06.24.
//

import SwiftUI

struct Point {
    let time: String
    let airport: String
}

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

struct SearchResultTicketView: View {
    let ticket: Ticket
    
    private var flightTime: String {
        let flightTime = abs(ticket.arrival.date - ticket.departure.date)
        let hour = flightTime / 3600
        var text = String(format: "%.1f", hour)
        
        text += "ч в пути"
        
        if !ticket.hasTransfer {
            text += "/Без пересадок"
        }
        
        return text
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .foregroundStyle(.directFlights)
            VStack {
                Text("\(self.ticket.price) ₽")
                    .font(.system(size: 22, weight: .semibold))
                    .padding(.top, 21)
                    .padding(.leading, 16)
                    .frame(maxWidth: .infinity, alignment: .leading)
                HStack {
                    RoundedRectangle(cornerRadius: 12)
                        .frame(width: 24, height: 24)
                        .foregroundStyle(.hotTickets)
                    SearchResultTicketPointView(point: self.ticket.departure)
                    VStack {
                        Rectangle()
                            .frame(width: 10, height: 1)
                            .foregroundStyle(.secondaryText)
                        Spacer()
                    }
                    .padding(.top, 9)
                    SearchResultTicketPointView(point: self.ticket.arrival)
                    VStack {
                        Text(flightTime)
                            .font(.system(size: 14))
                            .frame(alignment: .top)
                        Spacer()
                    }
                    Spacer()
                }
                .padding(.top, 16)
                .padding(.leading, 16)
                .padding(.bottom, 23)
                Spacer()
            }
            if let badge = ticket.badge {
                VStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: 21 / 2)
                            .foregroundStyle(.anywhere)
                        Text(badge)
                            .font(.system(size: 14, weight: .medium))
                            .italic()
                            .padding(.top, 2)
                            .padding(.horizontal, 10)
                    }
                    .frame(height: 21)
                    .padding(.trailing, 212)
                    Spacer()
                }
                .padding(.top, -8)
            }
        }
        .frame(height: 117)
    }
}
