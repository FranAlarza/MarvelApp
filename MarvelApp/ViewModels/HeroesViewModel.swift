//
//  HeroesViewModel.swift
//  MarvelApp
//
//  Created by Francisco Javier Alarza Sanchez on 15/10/22.
//

import Foundation
import Combine


final class HeroesViewModel: ObservableObject {
    @Published var heroes: [Result] = []
    @Published var status = Status.none
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        getHeroes()
    }
    
    func getHeroes() {
        status = .loading
        URLSession.shared
            .dataTaskPublisher(for: NetworkManager().getSessionHeroes())
            .tryMap {
                guard let response = $0.response as? HTTPURLResponse,
                        response.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                return $0.data
            }
            .decode(type: Hero.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink {[weak self] completion in
                switch completion {
                case .failure:
                    self?.status = .error
                case .finished:
                    self?.status = .loaded
                }
            } receiveValue: { [weak self] data in
                self?.heroes = data.data.results.filter { !$0.thumbnail.path.contains("image_not_available") }
                print(self?.heroes)
            }
            .store(in: &cancellables)
    }
}
