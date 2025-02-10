//
//  SignupView.swift
//  ClinikDB
//
//  Created by Hold Apps on 10/2/2025.
//


import SwiftUI

struct SignupView: View {
    @ObservedObject var viewModel: AuthViewModel

    var body: some View {
        VStack(spacing: 16) {
            Text("Sign up")
                .font(.largeTitle)
                .bold()

            TextField("Name", text: $viewModel.signupName)
                .textFieldStyle(RoundedBorderTextFieldStyle())

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
                viewModel.signup()
            }) {
                Text("Sign up")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
        }
        .padding()
        #if os(macOS)
        .frame(maxWidth: 400)
        #endif
    }
}
