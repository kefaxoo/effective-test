//
//  SearchView.swift
//  effective-test
//
//  Created by Bahdan Piatrouski on 6.06.24.
//

import SwiftUI

struct SearchView: View {
    @StateObject var viewModel: SearchViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            Color.searchBackground
                .ignoresSafeArea()
            VStack {
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 38, height: 5)
                    .foregroundColor(.dismiss)
                    .padding(.top, 16)
                    .onTapGesture {
                        dismiss()
                    }
                SearchBarView(state: .search, fromPlace: viewModel.$fromPlace, toPlace: viewModel.$toPlace)
                    .frame(height: 96)
                    .padding(.horizontal, 16)
                    .padding(.top, 25)
                HStack {
                    ForEach(SearchButton.allCases) { type in
                        SearchButtonView(type: type)
                            .frame(maxWidth: .infinity)
                            .onTapGesture {
                                if type == .anywhere {
                                    self.viewModel.toPlace = type.text
                                }
                                
                                dismiss()
                            }
                    }
                }
                .frame(maxHeight: 110)
                .padding(.top, 26)
                .padding(.horizontal, 16)
                ZStack {
                    RoundedRectangle(cornerRadius: 16)
                        .foregroundStyle(.greySearchBar)
                    VStack(alignment: .leading) {
                        ForEach(PopularDestination.allCases) { type in
                            PopularDestinationView(type: type)
                                .onTapGesture {
                                    self.viewModel.toPlace = type.name
                                    dismiss()
                                }
                            Rectangle()
                                .frame(height: 1)
                                .padding(.horizontal, 16)
                                .foregroundStyle(.dismiss)
                        }
                    }
                    .padding(.vertical, 16)
                }
                .frame(height: 216)
                .padding(.top, 26)
                .padding(.horizontal, 16)
                Spacer()
            }
        }
    }
}
