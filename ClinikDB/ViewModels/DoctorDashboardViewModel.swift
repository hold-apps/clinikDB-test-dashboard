//
//  DoctorDashboardViewModel.swift
//  ClinikDB
//
//  Created by Hold Apps on 10/2/2025.
//

import Foundation
import Combine

class DoctorDashboardViewModel: ObservableObject {
    @Published var workspaces: [Workspace] = []
    @Published var newWorkspaceName: String = ""

    func addWorkspace() {
        guard !newWorkspaceName.isEmpty else { return }
        let newWorkspace = Workspace(id: UUID(), name: newWorkspaceName, personnel: [])
        workspaces.append(newWorkspace)
        newWorkspaceName = ""
    }
}
