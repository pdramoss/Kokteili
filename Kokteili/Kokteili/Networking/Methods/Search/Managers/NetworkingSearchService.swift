//
//  NetworkingSearchService.swift
//  Kokteili
//
//  Created by Pedro Ramos on 27/01/25.
//

class NetworkingSearchService<Router: NetworkingRouterProtocol>: NetworkingBaseRouterProtocol, NetworkingSearchServiceProtocol where Router.EndPoint == NetworkingSearchAPI{
    var router: Router
    
    init(_ router: Router) {
        self.router = router
    }
    
    func searchBy(name query: String, completion: @escaping NetworkingRouterCompletion) {
        router.request(.name(query: query)) { completion($0, $1, $2) }
    }
}
