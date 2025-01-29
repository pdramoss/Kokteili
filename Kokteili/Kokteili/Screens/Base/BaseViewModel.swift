//
//  BaseViewModel.swift
//  Kokteili
//
//  Created by Pedro Ramos on 28/01/25.
//

import Foundation

enum LoadingState {
    case base
    case loading
    case success
    case failed(Error)
}

class BaseViewModel: ObservableObject {
    @Published var loadingState: LoadingState = .base
}
