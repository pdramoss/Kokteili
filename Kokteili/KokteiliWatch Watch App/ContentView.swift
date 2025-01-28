//
//  ContentView.swift
//  KokteiliWatch Watch App
//
//  Created by Pedro Ramos on 25/01/25.
//

import SwiftUI

struct ContentView: View {
    @State var food = ""
    var body: some View {
        VStack {
            TextField("What did you eat", text: $food)
            Button {
                
            } label: {
                Image(systemName: "plus.circle.dashed")
                    .symbolRenderingMode(.palette)
                    .foregroundStyle(.blue, .green)
                    .font(.system(size: 40))
            }
        }
        .padding()
        .ignoresSafeArea()
    }
    
    func sendFoodToOpenAI() {
        
    }
}

#Preview {
    ContentView()
}
