//
//  SearchSwiftUIView.swift
//  Kokteili
//
//  Created by Pedro Ramos on 27/01/25.
//

import SwiftUI

struct SearchSwiftUIView: View {
    @ObservedObject private var viewModel: SearchViewModel = SearchViewModel()
    
    var body: some View {
        VStack {
            Button("Search: ") {
                Task {
                    viewModel.getListBy("mojito")
                }
            }
            Text("COUNT: \(viewModel.count)")
        }
    }
}

#Preview {
    SearchSwiftUIView()
}
