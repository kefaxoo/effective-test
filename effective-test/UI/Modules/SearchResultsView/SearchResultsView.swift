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
            SearchBarView(state: .searchResults, fromPlace: viewModel.$fromPlace, toPlace: viewModel.$toPlace, backDidTap: {
                self.presentationModel.wrappedValue.dismiss()
            }, moveDidTap: {
                let temp = self.viewModel.fromPlace
                self.viewModel.fromPlace = self.viewModel.toPlace
                self.viewModel.toPlace = temp
            })
            .frame(height: 96)
            .padding(.top, 47)
            .padding(.horizontal, 16)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(self.viewModel.filters) { filter in
                        switch filter {
                            case .fromDate:
                                ZStack {
                                    FilterView(
                                        filter: .fromDate(
                                            date: self.viewModel.fromDate
                                        )
                                    )
                                    DatePicker(
                                        "",
                                        selection: self.$viewModel.fromDate,
                                        displayedComponents: [.date]
                                    )
                                    .opacity(0.05)
                                }
                            case .returnDate:
                                ZStack {
                                    FilterView(filter: filter)
                                    DatePicker(
                                        "",
                                        selection: self.$viewModel.returnDate,
                                        displayedComponents: [.date]
                                    )
                                    .opacity(0.05)
                                }
                            default:
                                FilterView(filter: filter)
                        }
                    }
                }
            }
            .contentMargins(.horizontal, 16, for: .scrollContent)
            .frame(height: 33)
            .padding(.vertical, 15)
            if !self.viewModel.ticketsOffers.isEmpty {
                ScrollView(.vertical) {
                    VStack {
                        ZStack {
                            RoundedRectangle(cornerRadius: 16)
                                .foregroundStyle(.directFlights)
                            VStack {
                                Text("Прямые рейсы")
                                    .font(.system(size: 20, weight: .semibold))
                                    .frame(
                                        maxWidth: .infinity,
                                        maxHeight: 42,
                                        alignment: .leading
                                    )
                                    .padding(.top, 16)
                                    .padding(.horizontal, 16)
                                ForEach(
                                    Array(self.viewModel.ticketsOffers.enumerated()),
                                    id: \.offset
                                ) { index, ticketOffer in
                                    TicketOffersView(
                                        index: index,
                                        ticketOffer: ticketOffer
                                    )
                                    Rectangle()
                                        .foregroundStyle(.separatorCustom)
                                        .frame(height: 1)
                                }
                                .padding(.horizontal, 16)
                            }
                        }
                        .frame(maxHeight: 288)
                        .padding(.top, 15)
                        .padding(.horizontal, 16)
                        NavigationLink {
                            SearchAllResultsView(
                                viewModel: SearchAllResultsViewModel(
                                    departTown: self.viewModel.fromPlace,
                                    arriveTown: self.viewModel.toPlace
                                )
                            )
                            .navigationBarBackButtonHidden(true)
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 8)
                                    .foregroundStyle(.anywhere)
                                Text("Посмотреть все билеты")
                                    .foregroundStyle(.white)
                                    .font(.system(size: 16, weight: .semibold))
                                    .italic()
                            }
                        }
                        .frame(height: 42)
                        .padding(.horizontal, 16)
                        .padding(.bottom, 39)
                        .padding(.top, 18)
                    }
                }
            } else if self.viewModel.shouldShowProgressView {
                Spacer()
                ProgressView()
                    .controlSize(.extraLarge)
            }
            Spacer()
        }
        .onAppear {
            self.viewModel.fetchTrips()
        }
    }
}
