//
//  NetworkingLookupAPI.swift
//  Kokteili
//
//  Created by Pedro Ramos on 27/01/25.
//

import Foundation

enum NetworkingLookupAPI {
    case cocktail(query: String)
    case ingredient(query: String)
}

extension NetworkingLookupAPI: EndPointType {
    var path: String {
        "/lookup.php"
    }
    
    var data: Data? {
        nil
    }
    
    var httpMethod: HTTPMethod {
        .get
    }
    
    var parameters: Parameters? {
        switch self {
        case let .cocktail(query):
            return ["i": query]
        case let .ingredient(query):
            return ["iid": query]
        }
    }
}
