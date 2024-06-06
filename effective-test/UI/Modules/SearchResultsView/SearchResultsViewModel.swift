//
//  SearchResultsViewModel.swift
//  effective-test
//
//  Created by Bahdan Piatrouski on 7.06.24.
//

import SwiftUI

final class SearchResultsViewModel: ObservableObject {
    @Binding var toPlace: String
    @Binding var fromPlace: String
    
    @Published var ticketsOffers = [TicketOffer]()
    @Published var shouldShowProgressView = true
    
    init(toPlace: Binding<String>, fromPlace: Binding<String>) {
        self._toPlace = toPlace
        self._fromPlace = fromPlace
    }
    
    func fetchTrips() {
        guard let url = URL(string: "https://run.mocky.io/v3/7e55bf02-89ff-4847-9eb7-7d83ef884017") else { return }
        
        let urlRequest = URLRequest(url: url)
        URLSession.shared.dataTask(with: urlRequest) { [weak self] data, _, _ in
            guard let data,
                  let offers = try? JSONDecoder().decode(TicketsOffers.self, from: data)
            else {
                DispatchQueue.main.async {
                    self?.shouldShowProgressView = false
                }
                
                return
            }
            
            DispatchQueue.main.async {
                self?.ticketsOffers = offers.ticketsOffers
                self?.shouldShowProgressView = false
            }
        }.resume()
    }
}
