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
    
    init(toPlace: Binding<String>, fromPlace: Binding<String>) {
        self._toPlace = toPlace
        self._fromPlace = fromPlace
    }
}
