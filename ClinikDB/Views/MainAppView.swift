//
//  MainAppView.swift
//  ClinikDB
//
//  Created by Hold Apps on 10/2/2025.
//

import SwiftUI

struct MainAppView: View {
    @StateObject private var authViewModel = AuthViewModel()

    var body: some View {
        NavigationView {
            content
                .navigationTitle("clinikDB")
        }
        #if os(iOS)
        .navigationViewStyle(StackNavigationViewStyle())
        #endif
    }

    @ViewBuilder
    private var content: some View {
        if authViewModel.isAuthenticated, let user = authViewModel.currentUser {
            DashboardView(user: user)
        } else {
            LoginView(viewModel: authViewModel)
        }
    }
}

