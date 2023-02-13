//
//  Image+Extension.swift
//  viaplaySections
//
//  Created by admin on 2023-02-13.
//

import Foundation
import SwiftUI

extension Image {
    init(_ asset: ImageAsset) {
        self.init(asset.name)
    }
}

extension ImageAsset {
    var justImage: SwiftUI.Image { SwiftUI.Image(self) }
}
