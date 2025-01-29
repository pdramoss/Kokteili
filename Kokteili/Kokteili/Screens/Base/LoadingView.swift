//
//  LoadingView.swift
//  Kokteili
//
//  Created by Pedro Ramos on 28/01/25.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        Image(systemName: "slowmo")
            .resizable()
            .frame(width: 200, height: 200, alignment: .center)
            .symbolRenderingMode(.palette)
            .foregroundStyle(.selection)
            .bold()
    }
}

#Preview {
    LoadingView()
}
