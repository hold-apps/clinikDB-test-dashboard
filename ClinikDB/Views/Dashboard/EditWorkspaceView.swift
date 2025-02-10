//
//  EditWorkspaceView.swift
//  ClinikDB
//
//  Created by Hold Apps on 10/2/2025.
//

import SwiftUI

struct EditWorkspaceView: View {
    @Environment(\.presentationMode) var presentationMode
    @State var workspace: Workspace
    var onSave: (Workspace) -> Void

    var body: some View {
        VStack(spacing: 16) {
            Text("Edit Workspace")
                .font(.largeTitle)
                .bold()
            
            TextField("Workspace Name", text: $workspace.name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Button("Save") {
                onSave(workspace)
                presentationMode.wrappedValue.dismiss()
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.green)
            .foregroundColor(.white)
            .cornerRadius(8)
            
            Spacer()
        }
        .padding()
        .frame(maxWidth: 400)
    }
}
