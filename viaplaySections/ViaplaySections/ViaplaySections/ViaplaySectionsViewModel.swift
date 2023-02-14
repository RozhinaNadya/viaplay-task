//
//  ViaplaySectionsViewModel.swift
//  ViaplaySections
//
//  Created by Nadya Rozhina on 2023-02-11.
//

import Foundation
import SwiftUI
import Combine

class ViaplaySectionsViewModel: ObservableObject {
    @Published var viaplaySectionsModel: ViaplaySectionsModel?

    private var cancellable: AnyCancellable?

    var links: [ViaplaySectionsModel.ViaplaySections.Section]? {
        viaplaySectionsModel?.links.viaplaySections
    }
    
    func getSectionsTitles() {
        self.cancellable = ViaplaySectionsManager.shared.getSectionsTitles()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in }, receiveValue: {
                self.viaplaySectionsModel = $0
            })
    }
}
