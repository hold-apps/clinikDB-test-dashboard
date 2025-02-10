//
//  DoctorDashboardView.swift
//  ClinikDB
//
//  Created by Hold Apps on 10/2/2025.
//

import SwiftUI

struct DoctorDashboardView: View {
    let user: User
    @StateObject private var viewModel = DoctorDashboardViewModel()

    var body: some View {
        VStack(alignment: .leading) {
            Text("Doctor Dashboard")
                .font(.largeTitle)
                .padding(.bottom)

            Text("Welcome Dr. \(user.name)")
                .font(.title2)

            Divider()
                .padding(.vertical)

            HStack {
                TextField("New Workspace Name", text: $viewModel.newWorkspaceName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button("Add Workspace") {
                    viewModel.addWorkspace()
                }
                .padding(.leading, 8)
            }
            .padding(.bottom)

            List(viewModel.workspaces) { workspace in
                VStack(alignment: .leading) {
                    Text(workspace.name)
                        .font(.headline)
                    Text("Personnel: \(workspace.personnel.count)")
                        .font(.subheadline)
                }
            }

            Spacer()
        }
        .padding()
    }
}
