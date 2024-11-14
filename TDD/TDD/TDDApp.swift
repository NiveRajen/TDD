//
//  TDDApp.swift
//  TDD
//
//  Created by Nivedha Rajendran on 14.11.24.
//

import SwiftUI

@main
struct TDDApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(model: FizzBuzzViewModel())
        }
    }
}
