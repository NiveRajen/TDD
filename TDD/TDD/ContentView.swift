//
//  ContentView.swift
//  TDD
//
//  Created by Nivedha Rajendran on 14.11.24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var model: FizzBuzzViewModel
    @State var input: Int
    
    init(model: FizzBuzzViewModel, input: Int? = nil) {
        self.model = model
        self.input = 3
    }
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .onAppear() {
            _ = model.fizzBuzz(input)
        }
    }
}

#Preview {
    ContentView(model: FizzBuzzViewModel())
}
