//
//  ContentView.swift
//  Kokteili
//
//  Created by Pedro Ramos on 25/01/25.
//

import SwiftUI

struct ContentView: View {
    var watchConnection = WatchConnector()

    var body: some View {
        HStack {
            SearchSwiftUIView()
        }
    }
}

#Preview {
    ContentView()
}
