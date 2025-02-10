//
//  PersonnelDashboardView.swift
//  ClinikDB
//
//  Created by Hold Apps on 10/2/2025.
//

import SwiftUI

struct PersonnelDashboardView: View {
    let user: User
    // In a real app, workspaces would be dynamically loaded.
    @State private var workspaces: [Workspace] = [
        Workspace(id: UUID(), name: "Demo Office 1", personnel: []),
        Workspace(id: UUID(), name: "Demo Office 2", personnel: [])
    ]

    var body: some View {
        VStack(alignment: .leading) {
            Text("Personnel Dashboard")
                .font(.largeTitle)
                .padding(.bottom)

            Text("Welcome \(user.name)")
                .font(.title2)

            Divider()
                .padding(.vertical)

            List(workspaces) { workspace in
                Text(workspace.name)
                    .font(.headline)
            }

            Spacer()
        }
        .padding()
    }
}
