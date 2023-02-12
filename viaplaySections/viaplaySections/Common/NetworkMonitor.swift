//
//  NetworkMonitor.swift
//  viaplaySections
//
//  Created by Nadya Rozhina on 2023-02-12.
//

import Foundation
import Network

class NetworkMonitor: ObservableObject {
    private let monitor = NWPathMonitor()
    private let queue = DispatchQueue(label: "NetworkMonitor")
    @Published var isConnected = true
    static let shared: NetworkMonitor = {
        NetworkMonitor()
    }()

    init() {
        monitor.pathUpdateHandler = { path in
            DispatchQueue.main.async {
                self.isConnected = path.status == .satisfied
            }
        }
        monitor.start(queue: queue)
    }
}
