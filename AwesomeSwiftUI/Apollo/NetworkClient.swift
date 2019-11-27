//
//  NetworkClient.swift
//  AwesomeSwiftUI
//
//  Created by Sergey Grischyov on 27.11.2019.
//  Copyright © 2019 Sergey Grischyov. All rights reserved.
//

import Foundation
import Apollo

class NetworkClient {
    // MARK: - Initialization
    static let shared = NetworkClient()
    
    private lazy var networkTransport = HTTPNetworkTransport(
        url: URL(string: "http://localhost:4000/graphql")!,
        delegate: self
    )
    
    private(set) lazy var apollo: ApolloClient = {
        let cache = try? SQLiteNormalizedCache(fileURL: dbURL)
        let store = ApolloStore(cache: cache ?? InMemoryNormalizedCache())
        return ApolloClient(networkTransport: self.networkTransport, store: store)
    }()
    
    private var dbURL: URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let dbPath = paths[0].absoluteString + "/com.shadeapps.AwesomeSwiftUI.cache"
        
        if !FileManager.default.fileExists(atPath: dbPath) {
            try? FileManager.default.createDirectory(atPath:
                dbPath, withIntermediateDirectories: true, attributes: nil)
        }
        
        return URL(fileURLWithPath: dbPath).appendingPathComponent("db.sqlite3")
    }
}

// MARK: - Preflight Delegate
extension NetworkClient: HTTPNetworkTransportPreflightDelegate {
    
    func networkTransport(_ networkTransport: HTTPNetworkTransport,
                          shouldSend request: URLRequest) -> Bool {
        return true
    }
    
    func networkTransport(_ networkTransport: HTTPNetworkTransport,
                          willSend request: inout URLRequest) {
        NetworkLogger.log(.debug, "Outgoing request: \(request)")
    }
}

// MARK: - Task Completed Delegate
extension NetworkClient: HTTPNetworkTransportTaskCompletedDelegate {
    func networkTransport(_ networkTransport: HTTPNetworkTransport,
                          didCompleteRawTaskForRequest request: URLRequest,
                          withData data: Data?,
                          response: URLResponse?,
                          error: Error?) {
        NetworkLogger.log(.debug, "Raw task completed for request: \(request)")
        
        if let error = error {
            NetworkLogger.log(.error, "Error: \(error)")
        }
        
        if let response = response {
            NetworkLogger.log(.debug, "Response: \(response)")
        } else {
            NetworkLogger.log(.error, "No URL Response received!")
        }
        
        if let data = data {
            NetworkLogger.log(.debug, "Data: \(String(describing: String(bytes: data, encoding: .utf8)))")
        } else {
            NetworkLogger.log(.error, "No data received!")
        }
    }
}

