//
//  ListContentViewModel.swift
//  Kokteili
//
//  Created by Pedro Ramos on 28/01/25.
//

import SwiftUI

class ListContentViewModel: ObservableObject {
    private var networking: NetworkingListAdapterProtocol?
    @Published var item: [String] = [String]()
    @Published var errorDescription: String = ""
    
    init(networking: NetworkingListAdapterProtocol? = NetworkingListAdapter()) {
        self.networking = networking
    }
    
    func getAllCategories() async throws {
        networking?.getAllCategories(completion: { [weak self] response in
            switch response {
            case let .success(categories):
                self?.item = categories.map { $0.strCategory }
            case let .failure(error):
                self?.errorDescription = error.localizedDescription
            }
        })
    }
    
    func getAllGlasses() async throws {
        networking?.getAllGlasses(completion: { [weak self] response in
            switch response {
            case let .success(glasses):
                self?.item = glasses.map { $0.strGlass }
            case let .failure(error):
                self?.errorDescription = error.localizedDescription
            }
        })
    }
    
    func getAllIngredients() async throws {
        networking?.getAllIngredients(completion: { [weak self] response in
            switch response {
            case let .success(ingredients):
                self?.item = ingredients.map { $0.strIngredient1 }
            case let .failure(error):
                self?.errorDescription = error.localizedDescription
            }
        })
    }
    
    func getAllAlcoholics() async throws {
        networking?.getAllAlcoholics(completion: { [weak self] response in
            switch response {
            case let .success(alcoholics):
                self?.item = alcoholics.map { $0.strAlcoholic }
            case let .failure(error):
                self?.errorDescription = error.localizedDescription
            }
        })
    }
}
