//
//  SearchViewModel.swift
//  Kokteili
//
//  Created by Pedro Ramos on 27/01/25.
//

import Foundation
import SwiftUI

struct CocktailItem: Equatable, Identifiable {
    var id: String
    var name: String
}

class SearchViewModel: BaseViewModel {
    private var networking: NetworkingSearchAdapterProtocol?
    @Published var cocktails: [CocktailItem] = [CocktailItem]()
    
    init(networking: NetworkingSearchAdapterProtocol? = NetworkingSearchAdapter()) {
        self.networking = networking
    }
    
    func getListBy(_ name: String) async throws {
        self.loadingState = .loading
        self.networking?.searchBy(name: name, completion: { [weak self] response in
            switch response {
            case let .success(entities):
                self?.updateList(entities: entities)
                self?.loadingState = .success
            case let .failure(error):
                self?.loadingState = .failed(error)
            }
        })
    }
    
    private func updateList(entities: [EntityCocktail]) {
        let cocktails = entities.map { CocktailItem(id: $0.idDrink, name: $0.strDrink) }
        self.cocktails = cocktails
    }
}
