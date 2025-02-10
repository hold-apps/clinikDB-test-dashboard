//
//  AuthService.swift
//  ClinikDB
//
//  Created by Hold Apps on 10/2/2025.
//
import Foundation

class AuthenticationService {
    static let shared = AuthenticationService()

    // In-memory storage for demo purposes.
    private var users: [User] = []

    func login(email: String, password: String) -> User? {
        // Check for a matching email and password hash.
        return users.first { $0.email == email && $0.passwordHash == hash(password) }
    }

    func signup(user: User) {
        users.append(user)
    }

    func hash(_ input: String) -> String {
        // Simple placeholder: reverse the string.
        // In production, use a secure hashing algorithm.
        return String(input.reversed())
    }
}
