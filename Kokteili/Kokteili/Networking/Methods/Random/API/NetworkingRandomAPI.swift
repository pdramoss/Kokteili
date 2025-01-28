//
//  NetworkingRandomAPI.swift
//  Kokteili
//
//  Created by Pedro Ramos on 27/01/25.
//

import Foundation

enum NetworkingRandomAPI {
    case random
}

extension NetworkingRandomAPI: EndPointType {
    var path: String {
        "/random.php"
    }
    
    var data: Data? {
        nil
    }
    
    var httpMethod: HTTPMethod {
        .get
    }
    
    var parameters: Parameters? {
        nil
    }
}
