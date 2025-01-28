//
//  NetworkingListAPI.swift
//  Kokteili
//
//  Created by Pedro Ramos on 27/01/25.
//

import Foundation

enum NetworkingListAPI: String {
    case categories = "c"
    case glasses = "g"
    case ingredients = "i"
    case alcoholic = "a"
}

extension NetworkingListAPI: EndPointType {
    var path: String {
        "/list.php"
    }
    
    var data: Data? {
        nil
    }
    
    var httpMethod: HTTPMethod {
        .get
    }
    
    var parameters: Parameters? {
        [self.rawValue : "list"]
    }
}
