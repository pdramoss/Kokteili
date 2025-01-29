//
//  FailedView.swift
//  Kokteili
//
//  Created by Pedro Ramos on 28/01/25.
//

import SwiftUI

struct FailedView: View {
    @State var errorMessage: String = ""
    var body: some View {
        VStack {
            Text(errorMessage)
                .font(.largeTitle)
            Image(systemName: "circle.hexagongrid.circle")
                .resizable()
                .frame(width: 160, height: 160, alignment: .center)
        }
        .bold()
        .symbolRenderingMode(.palette)
        .foregroundStyle(.red)
    }
}
#Preview {
    FailedView(errorMessage: "Failed")
}
