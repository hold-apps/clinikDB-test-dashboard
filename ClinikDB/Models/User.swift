//
//  User.swift
//  ClinikDB
//
//  Created by Hold Apps on 10/2/2025.
//

import Foundation

enum UserRole: String, Codable {
    case doctor
    case personnel
}

struct User: Identifiable, Codable {
    let id: UUID
    let name: String
    let email: String
    let role: UserRole
    let passwordHash: String
}
