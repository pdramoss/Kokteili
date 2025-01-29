//
//  NetworkingLookupAdapter.swift
//  Kokteili
//
//  Created by Pedro Ramos on 28/01/25.
//

class NetworkingLookupAdapter: DefaultNetworkManager, NetworkingLookupAdapterProtocol {
    var service: NetworkingLookupServiceProtocol
    
    init(_ service: NetworkingLookupServiceProtocol = NetworkingLookupService(NetworkingRouter<NetworkingLookupAPI>())) {
        self.service = service
    }
    
    func lookupBy(id query: String, completion: @escaping (Result<EntityCocktail, any Error>) -> Void) {
        service.lookupBy(id: query) { (data, response, error) in
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
                    if let cocktail = content.drinks.first {
                        completion(.success(cocktail))
                    } else {
                        completion(.failure(ErrorNetworking.noData))
                    }
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
