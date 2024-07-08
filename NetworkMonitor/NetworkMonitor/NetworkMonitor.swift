//
//  NetworkMonitor.swift
//  NetworkMonitor
//
//  Created by Husnain Ali on 08/07/2024.
//

import Foundation
import Network

protocol ReachabilityUC {
    func execute() -> Bool
}

class NetworkMonitor: ReachabilityUC {
    
    private let monitor: NWPathMonitor
    private let queue: DispatchQueue
    private var isConnected = true

    init() {
        monitor = NWPathMonitor()
        queue = DispatchQueue.global(qos: .background)
        monitor.pathUpdateHandler = { [weak self] path in
            self?.isConnected = path.status == .satisfied
        }
        monitor.start(queue: self.queue)
    }
    
    func execute() -> Bool {
        isConnected
    }
}
