//
//  SearchResultsView.swift
//  effective-test
//
//  Created by Bahdan Piatrouski on 6.06.24.
//

import SwiftUI

struct SearchResultsView: View {
    @StateObject var viewModel: SearchResultsViewModel
    @Environment(\.presentationMode) var presentationModel: Binding<PresentationMode>
    
    var body: some View {
        VStack {
            SearchBarView(state: .searchResults, fromPlace: $viewModel.fromPlace, toPlace: $viewModel.toPlace, backDidTap: {
                self.presentationModel.wrappedValue.dismiss()
            })
            .frame(height: 96)
            .padding(.top, 47)
            .padding(.horizontal, 16)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(Filter.allCases) { filter in
                        FilterView(filter: filter)
                    }
                }
            }
            .contentMargins(.horizontal, 16, for: .scrollContent)
            .frame(height: 33)
            .padding(.vertical, 15)
            if !self.viewModel.ticketsOffers.isEmpty {
                ZStack {
                    RoundedRectangle(cornerRadius: 16)
                        .foregroundStyle(.directFlights)
                    VStack {
                        Text("Прямые рейсы")
                            .font(.system(size: 20, weight: .semibold))
                            .frame(maxWidth: .infinity, maxHeight: 42, alignment: .leading)
                            .padding(.top, 16)
                            .padding(.horizontal, 16)
                        ForEach(Array(self.viewModel.ticketsOffers.enumerated()), id: \.offset) { index, ticketOffer in
                            TicketOffersView(index: index, ticketOffer: ticketOffer)
                            Rectangle()
                                .foregroundStyle(.separatorCustom)
                                .frame(height: 1)
                        }
                        .padding(.horizontal, 16)
                        Text("Показать все")
                            .foregroundStyle(.anywhere)
                            .font(.system(size: 16, weight: .semibold))
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 16)
                            .padding(.bottom, 16)
                            .padding(.top, 19)
                    }
                }
                .frame(maxHeight: 288)
                .padding(.top, 15)
                .padding(.horizontal, 16)
            } else if self.viewModel.shouldShowProgressView {
                Spacer()
                ProgressView()
                    .controlSize(.extraLarge)
            }
            Spacer()
            ZStack {
                RoundedRectangle(cornerRadius: 8)
                    .foregroundStyle(.anywhere)
                Text("Посмотреть все билеты")
                    .font(.system(size: 16, weight: .semibold))
                    .italic()
            }
            .frame(height: 42)
            .padding(.horizontal, 16)
            .padding(.bottom, 39)
        }
        .onAppear {
            self.viewModel.fetchTrips()
        }
    }
}



