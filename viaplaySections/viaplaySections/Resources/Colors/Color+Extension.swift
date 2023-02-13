//
//  Color+Extension.swift
//  viaplaySections
//
//  Created by Nadya Rozhina on 2023-02-13.
//

import Foundation
import SwiftUI

extension Color {
    init(_ asset: ColorAsset) {
        self.init(asset.name)
    }
}

extension ColorAsset {
    var justColor: SwiftUI.Color { SwiftUI.Color(self) }
}

