//
//  DashboardView.swift
//  ClinikDB
//
//  Created by Hold Apps on 10/2/2025.
//

import SwiftUI

struct DashboardView: View {
    let user: User
    @EnvironmentObject var authViewModel: AuthViewModel

    var body: some View {
        Group {
            if user.role == .doctor {
                DoctorDashboardView(user: user)
            } else {
                PersonnelDashboardView(user: user)
            }
        }
        .toolbar {
            #if os(iOS)
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Logout") {
                    authViewModel.logout()
                }
            }
            #elseif os(macOS)
            ToolbarItem(placement: .automatic) {
                Button("Logout") {
                    authViewModel.logout()
                }
            }
            #endif
        }
    }
}

