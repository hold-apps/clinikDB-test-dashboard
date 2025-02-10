//
//  AuthViewModel.swift
//  ClinikDB
//
//  Created by Hold Apps on 10/2/2025.
//

import Foundation
import Combine

class AuthViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var signupName: String = ""
    @Published var role: UserRole = .doctor
    @Published var isAuthenticated: Bool = false
    @Published var errorMessage: String?
    @Published var currentUser: User?

    private var cancellables = Set<AnyCancellable>()

    func login() {
        // Basic validation
        guard !email.isEmpty, !password.isEmpty else {
            errorMessage = "Email and password are required."
            return
        }

        // Attempt to log in via the authentication service
        if let user = AuthenticationService.shared.login(email: email, password: password) {
            currentUser = user
            isAuthenticated = true
        } else {
            errorMessage = "Invalid credentials."
        }
    }

    func signup() {
        // Basic validation for signup: require name, email, and password.
        guard !signupName.isEmpty, !email.isEmpty, !password.isEmpty else {
            errorMessage = "Name, email, and password are required."
            return
        }
        let newUser = User(
            id: UUID(),
            name: signupName,
            email: email,
            role: role,
            passwordHash: AuthenticationService.shared.hash(password)
        )
        AuthenticationService.shared.signup(user: newUser)
        currentUser = newUser
        isAuthenticated = true
    }
}
