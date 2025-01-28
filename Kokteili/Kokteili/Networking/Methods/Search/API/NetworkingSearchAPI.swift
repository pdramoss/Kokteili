//
//  NetworkingSearchAPI.swift
//  Kokteili
//
//  Created by Pedro Ramos on 27/01/25.
//

import Foundation

enum NetworkingSearchAPI {
    case name(query: String)
    case letter(query: String)
    case ingredient(query: String)
}

extension NetworkingSearchAPI: EndPointType {
    var path: String {
        "/search.php"
    }
    
    var data: Data? {
        nil
    }
    
    var httpMethod: HTTPMethod {
        .get
    }
    
    var parameters: Parameters? {
        switch self {
        case let .name(query):
            return ["s": query]
        case let .letter(query):
            return ["f": query]
        case let .ingredient(query):
            return ["i": query]
        }
    }
}
