//
//  NetworkMonitor.swift
//  Receitas
//
//  Created by Marcelo de Araújo on 09/11/2023..
//

import Foundation

import Network

class NetworkMonitor {
    static let instance = NetworkMonitor()
    private let networkMonitor = NWPathMonitor()
    private let workerQueue = DispatchQueue(label: "NetworkMonitor")
    
    var isConnected = false
    
    private init() {
        networkMonitor.pathUpdateHandler = { path in
            self.isConnected = path.status == .satisfied
        }
        
        networkMonitor.start(queue: workerQueue)
    }
}
