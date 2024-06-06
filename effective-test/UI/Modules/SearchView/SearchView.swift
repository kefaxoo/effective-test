//
//  SearchView.swift
//  effective-test
//
//  Created by Bahdan Piatrouski on 6.06.24.
//

import SwiftUI

struct SearchView: View {
    @StateObject var viewModel: SearchViewModel
    
    var body: some View {
        ZStack {
            Color("SearchBackgroundColor", bundle: .main)
                .ignoresSafeArea()
            VStack {
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 38, height: 5)
                    .foregroundColor(Color("Dismiss", bundle: .main))
                    .padding(.top, 16)
                    .onTapGesture {
                        viewModel.isSearchShow = false
                    }
                SearchBarView(state: .search, fromPlace: viewModel.$fromPlace, toPlace: viewModel.$toPlace)
                    .frame(height: 96)
                    .padding(.horizontal, 16)
                    .padding(.top, 25)
                HStack {
                    ForEach(SearchButton.allCases) { type in
                        SearchButtonView(type: type)
                            .frame(maxWidth: .infinity)
                    }
                }
                .frame(maxHeight: 110)
                .padding(.top, 26)
                .padding(.horizontal, 16)
                ZStack {
                    RoundedRectangle(cornerRadius: 16)
                        .foregroundStyle(Color("GreySearchBar", bundle: .main))
                    VStack(alignment: .leading) {
                        ForEach(PopularDestination.allCases) { type in
                            PopularDestinationView(type: type)
                                .onTapGesture {
                                    
                                }
                            Rectangle()
                                .frame(height: 1)
                                .padding(.horizontal, 16)
                                .foregroundStyle(Color("Dismiss", bundle: .main))
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
