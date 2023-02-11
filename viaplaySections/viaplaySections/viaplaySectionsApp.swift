//
//  viaplaySectionsApp.swift
//  viaplaySections
//
//  Created by admin on 2023-02-11.
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
