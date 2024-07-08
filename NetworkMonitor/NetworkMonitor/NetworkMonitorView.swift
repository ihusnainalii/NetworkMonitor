//
//  ContentView.swift
//  NetworkMonitor
//
//  Created by Husnain Ali on 08/07/2024.
//

import SwiftUI

struct NetworkMonitorView: View {
    
    @State private var isConnected = false
    
    let networkMonitor: ReachabilityUC
    
    init(networkMonitor: ReachabilityUC) {
        self.networkMonitor = networkMonitor
    }
    
    var body: some View {
        VStack {
            Spacer()
            
            if isConnected {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Hello, world!")
            } else {
                NetworkUnavailableView()
            }
            
            Spacer()
            
            Button {
                isConnected = networkMonitor.execute()
            } label: {
                Text("Check for internet")
                    .foregroundColor(.black)
            }
        }
        .onAppear {
            isConnected = networkMonitor.execute()
        }
        .padding()
    }
}

#Preview {
    NetworkMonitorView(networkMonitor: NetworkMonitor())
}
