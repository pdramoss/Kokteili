//
//  NetworkingSearchAdapterProtocol.swift
//  Kokteili
//
//  Created by Pedro Ramos on 27/01/25.
//

import Foundation

protocol NetworkingSearchAdapterProtocol {
    var service: NetworkingSearchServiceProtocol { get set }
    
    func searchBy(name query: String, completion: @escaping (Result<[EntityCocktail], Error>) -> Void)
}

protocol NetworkingSearchServiceProtocol {
    func searchBy(name query: String, completion: @escaping NetworkingRouterCompletion)
}
