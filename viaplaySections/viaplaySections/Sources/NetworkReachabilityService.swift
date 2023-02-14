//
//  NetworkReachabilityService.swift
//  viaplaySections
//
//  Created by Nadya Rozhina on 2023-02-14.
//

import Foundation
import Reachability

class NetworkReachabilityService {
    static let shared = NetworkReachabilityService()

    private init() { }

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
}
