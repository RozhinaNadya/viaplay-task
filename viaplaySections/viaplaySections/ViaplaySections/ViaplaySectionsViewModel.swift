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

class ViaplaySectionsViewModel: ObservableObject {
    @Published var viaplaySectionsTitles: ViaplaySectionsTitles?

    func getSectionsTitles() {
        guard let url = URL(string: "https://content.viaplay.com/ios-se") else { fatalError("Someting wrong with URL") }

        let urlRequest = URLRequest(url: url)

        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                print("Request error: ", error)
                return
            }

            guard let response = response as? HTTPURLResponse else { return }

            if response.statusCode == 200 {
                guard let data = data else { return }
                DispatchQueue.main.async {
                    do {
                        let decodedViaplayContent = try JSONDecoder().decode(ViaplaySectionsTitles.self, from: data)
                        self.viaplaySectionsTitles = decodedViaplayContent
                    } catch let error {
                        print("Error decoding: ", error)
                    }
                }
            }
        }

        dataTask.resume()
    }
}
