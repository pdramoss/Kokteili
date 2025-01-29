//
//  NetworkingLookupAdapterProtocol.swift
//  Kokteili
//
//  Created by Pedro Ramos on 28/01/25.
//

protocol NetworkingLookupAdapterProtocol {
    var service: NetworkingLookupServiceProtocol { get set }
    
    func lookupBy(id query: String, completion: @escaping (Result<EntityCocktail, Error>) -> Void)
}

protocol NetworkingLookupServiceProtocol {
    func lookupBy(id query: String, completion: @escaping NetworkingRouterCompletion)
}
