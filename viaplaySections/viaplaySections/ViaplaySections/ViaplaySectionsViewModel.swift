//
//  ViaplaySectionsViewModel.swift
//  viaplaySections
//
//  Created by Nadya Rozhina on 2023-02-11.
//

import Foundation
import SwiftUI
import Reachability

class ViaplaySectionsViewModel: ObservableObject {

    @Published var viaplaySectionsTitles: ViaplaySectionsModel?

    public var hasConnectivity: Bool {
        do {
            let reachability: Reachability = try Reachability()

            switch reachability.connection {
            case .unavailable:
                return false
            case .wifi, .cellular:
                return true
            }
        } catch {
            return true
        }
    }

    public func getSectionsTitles() {
        guard let url = URL(string: "https://content.viaplay.com/ios-se") else { fatalError("Someting wrong with URL") }

        var urlRequest = URLRequest(url: url)

        // Load from the cache
        if !hasConnectivity  {
            urlRequest.cachePolicy = .returnCacheDataElseLoad
        }

        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                print("Request error: ", error)
                return
            }

            guard let response = response as? HTTPURLResponse else { return }
            self.decodeSectionsTitlesJson(response: response, data: data)
        }
        dataTask.resume()
    }

    private func decodeSectionsTitlesJson(response: HTTPURLResponse, data: Data?) {
        if response.statusCode == 200 {
            guard let data = data else { return }
            DispatchQueue.main.sync {
                do {
                    let decodedViaplayContent = try JSONDecoder().decode(ViaplaySectionsModel.self, from: data)
                    self.viaplaySectionsTitles = decodedViaplayContent
                } catch let error {
                    print("Error decoding: ", error)
                }
            }
        }
    }
}
