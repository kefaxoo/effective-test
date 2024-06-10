//
//  SearchAllResultsView.swift
//  effective-test
//
//  Created by Bahdan Piatrouski on 8.06.24.
//

import SwiftUI

struct SearchAllResultsView: View {
    @StateObject var viewModel: SearchAllResultsViewModel
    @Environment(\.presentationMode) var presentationModel: Binding<PresentationMode>
    
    var body: some View {
        ZStack {
            VStack {
                ZStack {
                    Rectangle()
                        .foregroundStyle(.searchBackground)
                    HStack {
                        Image(.arrowLeft)
                            .foregroundStyle(.anywhere)
                            .frame(width: 24, height: 24)
                            .onTapGesture {
                                self.presentationModel.wrappedValue.dismiss()
                            }
                        VStack(alignment: .leading) {
                            Text(
                                "\(self.viewModel.departTown)-\(self.viewModel.arriveTown)"
                            )
                                .font(.system(size: 16, weight: .semibold))
                            Text("23 февраля, 1 пассажир")
                                .font(.system(size: 15, weight: .medium))
                                .foregroundStyle(.secondaryText)
                        }
                        .padding(.vertical, 8)
                        Spacer()
                    }
                }
                .frame(height: 56)
                .padding(.top, 16)
                .padding(.horizontal, 16)
                if !self.viewModel.tickets.isEmpty {
                    ScrollView(.vertical) {
                        VStack(spacing: 16) {
                            ForEach(self.viewModel.tickets) { ticket in
                                SearchResultTicketView(ticket: ticket)
                                Spacer()
                            }
                        }
                    }
                    .contentMargins(.top, 23, for: .scrollContent)
                    .contentMargins(.bottom, 53, for: .scrollContent)
                    .padding(.horizontal, 16)
                    .padding(.top, 34)
                    Spacer()
                } else if self.viewModel.shouldShowProgressView {
                    Spacer()
                    ProgressView().controlSize(.extraLarge)
                }
            }
            VStack {
                Spacer()
                ZStack {
                    RoundedRectangle(cornerRadius: 37 / 2)
                        .frame(height: 37)
                        .foregroundStyle(.anywhere)
                    HStack {
                        Image(.filters)
                            .frame(width: 16, height: 16)
                        Text("Фильтр")
                            .font(.system(size: 14, weight: .medium))
                            .padding(.leading, 4)
                        Image(.graphic)
                            .frame(width: 16, height: 16)
                            .padding(.leading, 16)
                        Text("График цен")
                            .font(.system(size: 14, weight: .medium))
                            .italic()
                            .padding(.leading, 4)
                    }
                    .padding(10)
                }
            }
            .padding(.horizontal, 78.5)
            .padding(.bottom, 16)
        }
        .onAppear {
            self.viewModel.fetchTickets()
        }
    }
}
