//
//  viaplaySectionsApp.swift
//  viaplaySections
//
//  Created by Nadya Rozhina on 2023-02-11.
//

import SwiftUI

@main
struct viaplaySectionsApp: App {
    var viaplaySectionsViewModel = ViaplaySectionsViewModel()

    var body: some Scene {
        WindowGroup {
            ViaplaySectionsView()
                .environmentObject(viaplaySectionsViewModel)
        }
    }
}
