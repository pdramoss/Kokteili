//
//  NetworkingListService.swift
//  Kokteili
//
//  Created by Pedro Ramos on 28/01/25.
//

class NetworkingListService<Router: NetworkingRouterProtocol>: NetworkingBaseRouterProtocol, NetworkingListServiceProtocol where Router.EndPoint == NetworkingListAPI{
    var router: Router
    
    init(_ router: Router) {
        self.router = router
    }
    
    func getAllCategories(completion: @escaping NetworkingRouterCompletion) {
        router.request(.categories) { completion($0, $1, $2) }
    }
    
    func getAllGlasses(completion: @escaping NetworkingRouterCompletion) {
        router.request(.glasses) { completion($0, $1, $2) }
    }
    
    func getAllIngredients(completion: @escaping NetworkingRouterCompletion) {
        router.request(.ingredients) { completion($0, $1, $2) }
    }
    
    func getAllAlcoholics(completion: @escaping NetworkingRouterCompletion) {
        router.request(.alcoholic) { completion($0, $1, $2) }
    }
}
