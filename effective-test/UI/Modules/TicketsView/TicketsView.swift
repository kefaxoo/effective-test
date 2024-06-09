//
//  TicketsView.swift
//  effective-test
//
//  Created by Bahdan Piatrouski on 6.06.24.
//

import SwiftUI

struct TicketsView: View {
    @StateObject var viewModel: TicketsViewModel
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Поиск дешевых авиабилетов")
                    .font(.system(size: 22, weight: .semibold))
                    .padding(.top, 26)
                    .padding(.horizontal, 90)
                    .multilineTextAlignment(.center)
                ZStack {
                    RoundedRectangle(cornerRadius: 16)
                        .foregroundStyle(.greySearchBar)
                    SearchBarView(state: .begin, fromPlace: $viewModel.fromPlace, toPlace: $viewModel.toPlace)
                        .padding(16)
                }
                .frame(height: 122)
                .padding(.horizontal, 16)
                .padding(.top, 38)
                .onTapGesture {
                    self.viewModel.isSearchShow = true
                }
                if !self.viewModel.musicDestinations.isEmpty {
                    Text("Музыкально отлететь")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 16)
                        .padding(.top, 32)
                        .font(.system(size: 22, weight: .semibold))
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(self.viewModel.musicDestinations) { destination in
                                MusicDestinationView(destination: destination)
                            }
                        }
                    }
                    .contentMargins(.horizontal, 16, for: .scrollContent)
                    .padding(.top, 26)
                } else if self.viewModel.shouldShowProgressView {
                    Spacer()
                    ProgressView()
                        .controlSize(.extraLarge)
                }
                NavigationLink(destination: SearchResultsView(viewModel: SearchResultsViewModel(toPlace: $viewModel.toPlace, fromPlace: $viewModel.fromPlace)).navigationBarBackButtonHidden(true), isActive: $viewModel.shouldPushResults) {
                    EmptyView()
                }
                Spacer()
            }
            .onAppear {
                self.viewModel.fetchMusicDestinations()
            }
            .sheet(isPresented: $viewModel.isSearchShow) {
                self.viewModel.isSearchShow = false
                
                if !self.viewModel.fromPlace.isEmpty,
                   !self.viewModel.toPlace.isEmpty {
                    self.viewModel.shouldPushResults = true
                }
            } content: {
                SearchView(viewModel: SearchViewModel(toPlace: $viewModel.toPlace, fromPlace: $viewModel.fromPlace))
            }
        }
    }
}
