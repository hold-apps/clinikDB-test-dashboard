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
    @State private var editingWorkspace: Workspace?  // Holds the workspace being edited.

    var body: some View {
        VStack(alignment: .leading) {
            Text("Doctor Dashboard")
                .font(.largeTitle)
                .padding(.bottom)
            
            Text("Welcome Dr. \(user.name)")
                .font(.title2)
            
            Divider()
                .padding(.vertical)
            
            // Add Workspace Section
            HStack {
                TextField("New Workspace Name", text: $viewModel.newWorkspaceName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button("Add Workspace") {
                    viewModel.addWorkspace()
                }
                .padding(.leading, 8)
            }
            .padding(.bottom)
            
            // List of Workspaces with explicit Edit and Delete buttons.
            List(viewModel.workspaces) { workspace in
                HStack {
                    VStack(alignment: .leading) {
                        Text(workspace.name)
                            .font(.headline)
                        Text("Personnel: \(workspace.personnel.count)")
                            .font(.subheadline)
                    }
                    Spacer()
                    // Edit button shows a sheet to edit the workspace.
                    Button("Edit") {
                        editingWorkspace = workspace
                    }
                    .buttonStyle(BorderlessButtonStyle())
                    .padding(.trailing, 8)
                    
                    // Delete button for explicit deletion.
                    Button("Delete") {
                        viewModel.deleteWorkspace(workspace)
                    }
                    .foregroundColor(.red)
                    .buttonStyle(BorderlessButtonStyle())
                }
            }
            
            Spacer()
        }
        .padding()
        // Present the edit sheet when a workspace is selected for editing.
        .sheet(item: $editingWorkspace) { workspace in
            EditWorkspaceView(workspace: workspace) { updatedWorkspace in
                viewModel.updateWorkspace(workspace, newName: updatedWorkspace.name)
            }
        }
    }
}

