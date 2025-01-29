//
//  DetailViewModel.swift
//  Kokteili
//
//  Created by Pedro Ramos on 28/01/25.
//

import Foundation
import SwiftUI

class DetailViewModel: BaseViewModel {
    private var networking: NetworkingLookupAdapterProtocol?
    @Published var cocktail: EntityCocktail?
    
    init(networking: NetworkingLookupAdapterProtocol? = NetworkingLookupAdapter()) {
        self.networking = networking
    }
    
    func getCocktailDetail(_ id: String) async throws {
        self.loadingState = .loading
        networking?.lookupBy(id: id, completion: { [weak self] response in
            switch response {
            case let .success(entity):
                self?.cocktail = entity
                self?.loadingState = .success
            case let .failure(error):
                self?.loadingState = .failed(error)
            }
        })
    }
}
