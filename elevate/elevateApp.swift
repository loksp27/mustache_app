//
//  elevateApp.swift
//  elevate
//
//  Created by Loksubhash Pulivarthi on 3/5/24.
//

import SwiftUI
import SwiftData
import UniformTypeIdentifiers

@main
struct elevateApp: App {
    var body: some Scene {
        DocumentGroup(editing: .itemDocument, migrationPlan: elevateMigrationPlan.self) {
            ContentView()
        }
    }
}

extension UTType {
    static var itemDocument: UTType {
        UTType(importedAs: "com.example.item-document")
    }
}

struct elevateMigrationPlan: SchemaMigrationPlan {
    static var schemas: [VersionedSchema.Type] = [
        elevateVersionedSchema.self,
    ]

    static var stages: [MigrationStage] = [
        // Stages of migration between VersionedSchema, if required.
    ]
}

struct elevateVersionedSchema: VersionedSchema {
    static var versionIdentifier = Schema.Version(1, 0, 0)

    static var models: [any PersistentModel.Type] = [
        Item.self,
    ]
}
