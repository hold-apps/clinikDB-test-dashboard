//
//  LoginView.swift
//  ClinikDB
//
//  Created by Hold Apps on 10/2/2025.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var viewModel: AuthViewModel

    var body: some View {
        VStack(spacing: 16) {
            Text("Login")
                .font(.largeTitle)
                .bold()

            #if os(iOS)
            TextField("Email", text: $viewModel.email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .autocapitalization(.none)
            #elseif os(macOS)
            TextField("Email", text: $viewModel.email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            #endif

            SecureField("Password", text: $viewModel.password)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            Picker("Role", selection: $viewModel.role) {
                Text("Doctor").tag(UserRole.doctor)
                Text("Personnel").tag(UserRole.personnel)
            }
            .pickerStyle(SegmentedPickerStyle())

            if let errorMessage = viewModel.errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
            }

            Button(action: {
                viewModel.login()
            }) {
                Text("Login")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }

            // Updated NavigationLink for Sign up
            NavigationLink(destination: SignupView(viewModel: viewModel)) {
                Text("Sign up")
                    .foregroundColor(.blue)
                    .underline()
                    .padding(.vertical, 8)
            }
            // Apply a plain button style to ensure it looks interactive.
            #if os(macOS)
            .buttonStyle(PlainButtonStyle())
            #endif
        }
        .padding()
        #if os(macOS)
        .frame(maxWidth: 400)
        #endif
    }
}
