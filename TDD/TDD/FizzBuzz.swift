//
//  FizzBuzz.swift
//  TDD
//
//  Created by Nivedha Rajendran on 14.11.24.
//
import SwiftUI
import Combine

class FizzBuzzViewModel: ObservableObject {
    let user: User?
    
    init() {
        self.user = User(firstName: "Nivedha", lastName: "Rajendran")
    }
    
    func fizzBuzz(_ number: Int) -> String {
        let divisibleBy3 = (number % 3 == 0)

        let divisibleBy5 = (number % 5 == 0)

        switch (divisibleBy3, divisibleBy5) {

        case (false, false):
            return "\(number)"

        case (true, false):
            return "fizz"

        case (false, true):
            return "buzz"

        case (true, true):
            return "fizz-buzz"
        }
        
    }
    
    func asyncSum (value1: Int, value2: Int, handler: @escaping ((Int) -> Void)) {
        handler(value1 + value2)
    }
}
