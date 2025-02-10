//
//  AuthenticationSwitcherView.swift
//  ClinikDB
//
//  Created by Hold Apps on 10/2/2025.
//

import SwiftUI

struct AuthenticationSwitcherView: View {
    @ObservedObject var viewModel: AuthViewModel
    @State private var showLogin: Bool = true

    var body: some View {
        VStack {
            if showLogin {
                LoginView(viewModel: viewModel, onSwitch: {
                    withAnimation {
                        showLogin = false
                        viewModel.errorMessage = nil
                    }
                })
            } else {
                SignupView(viewModel: viewModel, onSwitch: {
                    withAnimation {
                        showLogin = true
                        viewModel.errorMessage = nil
                    }
                })
            }
        }
    }
}
