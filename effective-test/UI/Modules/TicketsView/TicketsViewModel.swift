//
//  TicketsViewModel.swift
//  effective-test
//
//  Created by Bahdan Piatrouski on 6.06.24.
//

import SwiftUI

final class TicketsViewModel: ObservableObject {
    @Published var musicDestinations = [MusicDestination]()
    @Published var shouldShowProgressView = true
    @Published var isSearchShow = false
    
    @Published var fromPlace = (UserDefaults.standard.value(forKey: "fromPlace") as? String) ?? "" {
        didSet {
            UserDefaults.standard.setValue(self.fromPlace, forKey: "fromPlace")
        }
    }
    
    @Published var toPlace = ""
    
    func fetchMusicDestinations() {
        guard let url = URL(string: "https://run.mocky.io/v3/214a1713-bac0-4853-907c-a1dfc3cd05fd") else { return }
        
        let urlRequest = URLRequest(url: url)
        URLSession.shared.dataTask(with: urlRequest) { [weak self] data, response, error in
            guard let data,
                  let offers = try? JSONDecoder().decode(MusicDestinationOffers.self, from: data)
            else {
                DispatchQueue.main.async {
                    self?.shouldShowProgressView = false
                }
                
                return
            }
            
            DispatchQueue.main.async {
                self?.shouldShowProgressView = false
                self?.musicDestinations = offers.offers
            }
        }.resume()
    }
}
