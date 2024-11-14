//
//  User.swift
//  TDD
//
//  Created by Nivedha Rajendran on 14.11.24.
//

struct User {
    var firstName: String
    var lastName: String
    
    func fullName() -> String {
        return "\(firstName) \(lastName)"
    }
}
