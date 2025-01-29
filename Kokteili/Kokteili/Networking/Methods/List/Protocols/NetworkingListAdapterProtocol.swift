//
//  NetworkingListAdapterProtocol.swift
//  Kokteili
//
//  Created by Pedro Ramos on 28/01/25.
//

protocol NetworkingListAdapterProtocol {
    var service: NetworkingListServiceProtocol { get set }
    
    func getAllCategories(completion: @escaping (Result<[EntityCategory], Error>) -> Void)
    func getAllGlasses(completion: @escaping (Result<[EntityGlass], Error>) -> Void)
    func getAllIngredients(completion: @escaping (Result<[EntityIngredient], Error>) -> Void)
    func getAllAlcoholics(completion: @escaping (Result<[EntityAlcoholic], Error>) -> Void)
}

protocol NetworkingListServiceProtocol {
    func getAllCategories(completion: @escaping NetworkingRouterCompletion)
    func getAllGlasses(completion: @escaping NetworkingRouterCompletion)
    func getAllIngredients(completion: @escaping NetworkingRouterCompletion)
    func getAllAlcoholics(completion: @escaping NetworkingRouterCompletion)
}
