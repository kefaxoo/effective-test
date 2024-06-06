//
//  SearchViewModel.swift
//  effective-test
//
//  Created by Bahdan Piatrouski on 6.06.24.
//

import SwiftUI

final class SearchViewModel: ObservableObject {
    @Binding var toPlace: String
    @Binding var fromPlace: String
    @Binding var isSearchShow: Bool
    
    init(toPlace: Binding<String>, fromPlace: Binding<String>, isSearchShow: Binding<Bool>) {
        self._toPlace = toPlace
        self._fromPlace = fromPlace
        self._isSearchShow = isSearchShow
    }
}
