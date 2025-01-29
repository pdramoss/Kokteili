//
//  NetworkingListAdapter.swift
//  Kokteili
//
//  Created by Pedro Ramos on 28/01/25.
//

import Foundation

class NetworkingListAdapter: DefaultNetworkManager, NetworkingListAdapterProtocol {
    var service: NetworkingListServiceProtocol
    
    init(_ service: NetworkingListServiceProtocol = NetworkingListService(NetworkingRouter<NetworkingListAPI>())) {
        self.service = service
    }
    
    func getAllCategories(completion: @escaping (Result<[EntityCategory], any Error>) -> Void) {
        service.getAllCategories { data, response, error in
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
                    let content: EntityDrink<[EntityCategory]> = try self.load(data: data)
                    completion(.success(content.drinks))
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func getAllGlasses(completion: @escaping (Result<[EntityGlass], any Error>) -> Void) {
        service.getAllGlasses { data, response, error in
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
                    let content: EntityDrink<[EntityGlass]> = try self.load(data: data)
                    completion(.success(content.drinks))
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func getAllIngredients(completion: @escaping (Result<[EntityIngredient], any Error>) -> Void) {
        service.getAllIngredients { data, response, error in
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
                    let content: EntityDrink<[EntityIngredient]> = try self.load(data: data)
                    completion(.success(content.drinks))
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func getAllAlcoholics(completion: @escaping (Result<[EntityAlcoholic], any Error>) -> Void) {
        service.getAllAlcoholics { data, response, error in
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
                    let content: EntityDrink<[EntityAlcoholic]> = try self.load(data: data)
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
