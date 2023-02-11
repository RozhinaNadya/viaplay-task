//
//  ViaplaySectionsViewModel.swift
//  viaplaySections
//
//  Created by Nadya Rozhina on 2023-02-11.
//

import Foundation

public struct ViaplaySectionsTitles: Decodable {
    public var links: ViaplaySections

    enum CodingKeys: String, CodingKey {
        case links = "_links"
    }

    public struct ViaplaySections: Decodable {
        public var viaplaySections: [Section]

        enum CodingKeys: String, CodingKey {
            case viaplaySections = "viaplay:sections"
        }

        public struct Section: Decodable, Identifiable {
            public var id: String
            public var title: String

            enum CodingKeys: String, CodingKey {
                case id
                case title
            }
        }
    }
}
