//
//  DashboardView.swift
//  ClinikDB
//
//  Created by Hold Apps on 10/2/2025.
//

import SwiftUI

struct DashboardView: View {
    let user: User

    var body: some View {
        Group {
            if user.role == .doctor {
                DoctorDashboardView(user: user)
            } else {
                PersonnelDashboardView(user: user)
            }
        }
    }
}
