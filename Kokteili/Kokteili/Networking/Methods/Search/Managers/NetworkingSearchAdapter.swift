//
//  NetworkingSearchAdapter.swift
//  Kokteili
//
//  Created by Pedro Ramos on 27/01/25.
//

import Foundation

class NetworkingSearchAdapter: DefaultNetworkManager, NetworkingSearchAdapterProtocol {
    var service: NetworkingSearchServiceProtocol
    
    init(_ service: NetworkingSearchServiceProtocol = NetworkingSearchService(NetworkingRouter<NetworkingSearchAPI>())) {
        self.service = service
    }
    
    func searchBy(name query: String, completion: @escaping (Result<[EntityCocktail], any Error>) -> Void) {
        service.searchBy(name: query) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let response = response else {
                completion(.failure(ErrorNetworking.failed))
                return
            }
            switch self.handleNetwork(response) {
            case .success:
                do {
                    let content: EntityDrink<[EntityCocktail]> = try self.load(data: data)
                    completion(.success(content.drinks))
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
