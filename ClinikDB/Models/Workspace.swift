//
//  Workspace.swift
//  ClinikDB
//
//  Created by Hold Apps on 10/2/2025.
//
import Foundation

struct Workspace: Identifiable, Codable {
    let id: UUID
    let name: String
    let personnel: [User]
}
