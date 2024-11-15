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
        self.input = input ?? 3
    }
    var body: some View {
        VStack {
            
            Button("Tap") {
                model.tappedCount()
            }
            Text("Tapped Count: \(model.count)")
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
