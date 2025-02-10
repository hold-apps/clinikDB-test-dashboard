//
//  SignupView.swift
//  ClinikDB
//
//  Created by Hold Apps on 10/2/2025.
//


import SwiftUI

struct SignupView: View {
    @ObservedObject var viewModel: AuthViewModel
    var onSwitch: () -> Void

    var body: some View {
        VStack(spacing: 16) {
            Text("Sign Up")
                .font(.largeTitle)
                .bold()

            TextField("Name", text: $viewModel.signupName)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            TextField("Email", text: $viewModel.email)
                .textFieldStyle(RoundedBorderTextFieldStyle())

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
                Text("Sign Up")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }

            Button(action: {
                onSwitch()
            }) {
                Text("Already have an account? Login")
                    .foregroundColor(.blue)
                    .underline()
                    .padding(.vertical, 8)
            }
            .buttonStyle(PlainButtonStyle())
        }
        .padding()
        .frame(maxWidth: 400)
    }
}
