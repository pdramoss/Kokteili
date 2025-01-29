//
//  DetailSwiftUIView.swift
//  Kokteili
//
//  Created by Pedro Ramos on 28/01/25.
//

import SwiftUI

struct DetailSwiftUIView: View {
    let id: String
    @ObservedObject private var viewModel: DetailViewModel
    
    init(id: String, viewModel: DetailViewModel = DetailViewModel()) {
        self.id = id
        self.viewModel = viewModel
    }
    
    var body: some View {
        BigBaseView(state: viewModel.loadingState) {
            VStack(alignment: .center) {
                VStack {
                    Text(viewModel.cocktail?.strDrink ?? "")
                        .font(.largeTitle)
                        .foregroundStyle(.black)
                        .bold()
                    Text(viewModel.cocktail?.strGlass ?? "")
                        .font(.subheadline)
                        .foregroundStyle(.gray)
                }
                Divider()
                Text(viewModel.cocktail?.strAlcoholic ?? "")
                    .font(.headline)
                Divider()
                Text(viewModel.cocktail?.strCategory ?? "")
                    .font(.headline)
                Divider()
                Text(viewModel.cocktail?.strInstructions ?? "")
                    .font(.callout)
                Spacer()
            }.padding()
        }
        .onAppear {
            Task {
                try await viewModel.getCocktailDetail(id)
            }
        }
    }
}

#Preview {
    DetailSwiftUIView(id: "11000")
}
