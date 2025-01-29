//
//  NetworkingLookupService.swift
//  Kokteili
//
//  Created by Pedro Ramos on 28/01/25.
//

class NetworkingLookupService<Router: NetworkingRouterProtocol>: NetworkingBaseRouterProtocol, NetworkingLookupServiceProtocol where Router.EndPoint == NetworkingLookupAPI{
    var router: Router
    
    init(_ router: Router) {
        self.router = router
    }
    
    func lookupBy(id query: String, completion: @escaping NetworkingRouterCompletion) {
        router.request(.cocktail(query: query)) { completion($0, $1, $2) }
    }
}
