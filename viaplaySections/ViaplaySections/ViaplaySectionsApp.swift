//
//  ViaplaySectionsApp.swift
//  ViaplaySections
//
//  Created by Nadya Rozhina on 2023-02-11.
//

import SwiftUI

@main
struct ViaplaySectionsApp: App {
    var viaplaySectionsViewModel = ViaplaySectionsViewModel()

    var body: some Scene {
        WindowGroup {
            ViaplaySectionsView()
                .environmentObject(viaplaySectionsViewModel)
        }
    }
}
