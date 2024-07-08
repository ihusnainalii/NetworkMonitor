//
//  NetworkMonitorApp.swift
//  NetworkMonitor
//
//  Created by Husnain Ali on 08/07/2024.
//

import SwiftUI

@main
struct NetworkMonitorApp: App {
    var body: some Scene {
        WindowGroup {
            NetworkMonitorView(networkMonitor: NetworkMonitor())
        }
    }
}
