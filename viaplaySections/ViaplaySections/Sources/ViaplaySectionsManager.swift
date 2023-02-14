//
//  ViaplaySectionsManager.swift
//  ViaplaySections
//
//  Created by Nadya Rozhina on 2023-02-14.
//

import Foundation
import Combine

protocol IViaplaySectionsManager {
    func getSectionsTitles() -> AnyPublisher<ViaplaySectionsModel, Error>
}

class ViaplaySectionsManager: IViaplaySectionsManager {
    static let shared = ViaplaySectionsManager()

    private init() { }

    func getSectionsTitles() -> AnyPublisher<ViaplaySectionsModel, Error> {
        guard let url = URL(string: .viaplaySectionsUrl) else { fatalError("Someting wrong with URL") }

        var urlRequest = URLRequest(url: url)

        // Load from the cache
        if !NetworkReachabilityService.shared.hasConnectivity  {
            urlRequest.cachePolicy = .returnCacheDataElseLoad
        }

        return URLSession.shared.dataTaskPublisher(for: urlRequest)
            .tryMap {
                try self.decodeSectionsTitlesJson(response: $0.response, data: $0.data)
            }
            .eraseToAnyPublisher()
    }

    private func decodeSectionsTitlesJson(response: URLResponse, data: Data?) throws -> ViaplaySectionsModel {
        guard let data else { throw ResponseError.decodeSectionsTitlesError }

        let decodedViaplayContent = try JSONDecoder().decode(ViaplaySectionsModel.self, from: data)
        return decodedViaplayContent
    }
}

enum ResponseError: Error {
    case decodeSectionsTitlesError
}

private extension String {
    static let viaplaySectionsUrl = "https://content.viaplay.com/ios-se"
}
