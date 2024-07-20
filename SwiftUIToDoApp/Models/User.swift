//
//  User.swift
//  SwiftUIToDoApp
//
//  Created by Harun AYDIN on 8.07.2024.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
