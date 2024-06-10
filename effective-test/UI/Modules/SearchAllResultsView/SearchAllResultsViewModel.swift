//
//  SearchAllResultsViewModel.swift
//  effective-test
//
//  Created by Bahdan Piatrouski on 9.06.24.
//

import Foundation


final class SearchAllResultsViewModel: ObservableObject {
    @Published var tickets = [Ticket]()
    @Published var shouldShowProgressView = true
    
    let departTown: String
    let arriveTown: String
    
    init(departTown: String, arriveTown: String) {
        self.departTown = departTown
        self.arriveTown = arriveTown
    }
    
    func fetchTickets() {
        guard let url = URL(
            string: "https://run.mocky.io/v3/670c3d56-7f03-4237-9e34-d437a9e56ebf"
        ) else {
            self.shouldShowProgressView = false
            return
        }
        
        let urlRequest = URLRequest(url: url)
        URLSession.shared.dataTask(with: urlRequest) { [weak self] data, _, _ in
            guard let data,
                  let tickets = try? JSONDecoder().decode(Tickets.self, from: data)
            else {
                DispatchQueue.main.async {
                    self?.shouldShowProgressView = false
                }
                
                return
            }
            
            DispatchQueue.main.async {
                self?.shouldShowProgressView = false
                self?.tickets = tickets.tickets
            }
        }.resume()
    }
}
