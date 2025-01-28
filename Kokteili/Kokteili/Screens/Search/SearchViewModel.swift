//
//  SearchViewModel.swift
//  Kokteili
//
//  Created by Pedro Ramos on 27/01/25.
//

import Foundation
import SwiftUI

class SearchViewModel: ObservableObject {
    private var networking: NetworkingSearchAdapterProtocol?
    @Published var cocktailsID: [String] = [String]()
    @Published var error: String = String()
    @Published var count: Int = .zero
    
    init(networking: NetworkingSearchAdapterProtocol? = NetworkingSearchAdapter()) {
        self.networking = networking
    }
    
    func getListBy(_ name: String) {
        self.networking?.searchBy(name: name, completion: { response in
            switch response {
            case let .success(entities):
                self.updateList(entities: entities)
            case let .failure(error):
                self.error = error.localizedDescription
            }
        })
    }
    
    private func updateList(entities: [EntityCocktail]) {
        let ids = entities.map { $0.idDrink }
        DispatchQueue.main.async {
            self.cocktailsID = ids
            self.count = ids.count
        }
    }
}
