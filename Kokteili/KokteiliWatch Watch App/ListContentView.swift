//
//  ListContentView.swift
//  KokteiliWatch Watch App
//
//  Created by Pedro Ramos on 25/01/25.
//

import SwiftUI
enum ListOptions: String {
    case categories = "c"
    case glasses = "g"
    case ingredients = "i"
    case alcoholic = "a"
}

struct ListContentView: View {
    @ObservedObject private var viewModel: ListContentViewModel = ListContentViewModel()
    
    var body: some View {
        Grid {
            GridRow {
                Button("Categories") {
                    getAllList(.categories)
                }
                Button("Glasses") {
                    getAllList(.glasses)
                }
            }
            Divider()
                .gridCellUnsizedAxes(.horizontal)
            GridRow {
                Button("Ingredients") {
                    getAllList(.ingredients)
                }
                Button("Alcoholics") {
                    getAllList(.alcoholic)
                }
            }
        }
        .ignoresSafeArea()
    }
    
    func getAllList(_ list: ListOptions) {
        Task {
            do {
                switch list {
                case .categories:
                    try await viewModel.getAllCategories()
                case .glasses:
                    try await viewModel.getAllGlasses()
                case .ingredients:
                    try await viewModel.getAllIngredients()
                case .alcoholic:
                    try await viewModel.getAllAlcoholics()
                }
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

#Preview {
    ListContentView()
}
