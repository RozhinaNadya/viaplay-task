//
//  ViaplaySectionsModel.swift
//  ViaplaySections
//
//  Created by Nadya Rozhina on 2023-02-14.
//

import Foundation

struct ViaplaySectionsModel: Decodable {
    var links: ViaplaySections

    enum CodingKeys: String, CodingKey {
        case links = "_links"
    }

    struct ViaplaySections: Decodable {
        var viaplaySections: [Section]

        enum CodingKeys: String, CodingKey {
            case viaplaySections = "viaplay:sections"
        }

        struct Section: Decodable, Identifiable {
            var id: String
            var title: String

        }
    }
}
