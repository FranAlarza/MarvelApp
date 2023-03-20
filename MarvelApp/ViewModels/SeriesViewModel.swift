//
//  SeriesViewModel.swift
//  MarvelApp
//
//  Created by Francisco Javier Alarza Sanchez on 16/10/22.
//

import Foundation
import Combine

class SeriesViewModel: ObservableObject {
    @Published var series: [Series] = []
    private var cancellables = Set<AnyCancellable>()
    
    
    func getSeries(id: String) {
        URLSession.shared.dataTaskPublisher(for: NetworkManager().getSessionSeries(from: id))
            .tryMap {
                guard let response = $0.response as? HTTPURLResponse,
                        response.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                return $0.data
            }
            .decode(type: DataSeriesResult.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .finished:
                    print("Series descargadas")
                case .failure(let error):
                    print("Error al descargar las series: \(error)")
                }
            } receiveValue: { data in
                self.series = data.data.results.filter { !$0.thumbnail.path.contains("image_not_available") }
            }
            .store(in: &cancellables)
    }
}
