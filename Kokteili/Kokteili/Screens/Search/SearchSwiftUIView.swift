//
//  SearchSwiftUIView.swift
//  Kokteili
//
//  Created by Pedro Ramos on 27/01/25.
//

import SwiftUI

struct SearchSwiftUIView: View {
    @ObservedObject private var viewModel: SearchViewModel = SearchViewModel()
    @State var cocktailName: String = String()
    
    var body: some View {
        BigBaseView(state: viewModel.loadingState) {
            VStack {
                searchBar
                if !viewModel.cocktails.isEmpty {
                    listCocktails
                }
            }
            .navigationTitle("Kokteili")
        }
        .embedNavigationView()
    }
    
    @ViewBuilder
    var searchBar: some View {
        HStack {
            TextField("Cocktail Name", text: $cocktailName)
            if cocktailName.count >= 3 {
                Button {
                    Task { try await viewModel.getListBy(cocktailName) }
                } label: {
                    Image(systemName: "magnifyingglass.circle")
                        .font(.title)
                }
            }
        }
        .padding(8)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(.selection, lineWidth: 2)
        )
        .padding(.horizontal)
    }
    
    @ViewBuilder
    var listCocktails: some View {
        List(viewModel.cocktails, id: \.id) { item in
            NavigationLink(destination: DetailSwiftUIView(id: item.id)) {
                Text(item.name)
            }
            .listRowSeparator(.hidden)
        }
        .listStyle(.plain)
        .scrollIndicators(.hidden)
        .scrollContentBackground(.hidden)
    }
}

#Preview {
    SearchSwiftUIView()
}
