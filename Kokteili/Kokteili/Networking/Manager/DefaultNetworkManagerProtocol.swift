//
//  DefaultNetworkManagerProtocol.swift
//  Kokteili
//
//  Created by Pedro Ramos on 27/01/25.
//

import Foundation

protocol DefaultNetworkManagerProtocol {
    func handleNetwork(_ response: HTTPURLResponse) -> Result<Bool, Error>
}

class DefaultNetworkManager: DefaultNetworkManagerProtocol {
    
    func load<T: Decodable> (data: Data?, as type: T.Type = T.self) throws -> T {
        guard let data = data else { throw ErrorNetworking.noData }
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            return try decoder.decode(T.self, from: data)
        } catch {
            throw ErrorNetworking.unableToDecode
        }
    }
    
    func handleNetwork(_ response: HTTPURLResponse) -> Result<Bool, Error> {
        switch response.statusCode {
        case 200...299: return .success(true)
        case 400...499: return .failure(ErrorNetworking.authentication)
        case 500...599: return .failure(ErrorNetworking.badRequest)
        case 600: return .failure(ErrorNetworking.outDated)
        default: return .failure(ErrorNetworking.failed)
        }
    }
}
