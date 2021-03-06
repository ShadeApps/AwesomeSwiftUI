//
//  NetworkClient.swift
//  AwesomeSwiftUI
//
//  Created by Sergey Grischyov on 27.11.2019.
//  Copyright © 2019 Sergey Grischyov. All rights reserved.
//

import Foundation
import Apollo

private enum Constants {
    static let baseURL = "http://localhost:4000/graphql"
    static let dbPath = "/com.shadeapps.AwesomeSwiftUI.cache"
    static let dbName = "db.sqlite3"
}

class NetworkClient {
    // MARK: - Initialization
    static let shared = NetworkClient()

    private lazy var networkTransport = HTTPNetworkTransport(
        url: URL(string: Constants.baseURL)!,
        delegate: self
    )

    private(set) lazy var apollo: ApolloClient = {
        let cache = try? SQLiteNormalizedCache(fileURL: dbURL)
        let store = ApolloStore(cache: cache ?? InMemoryNormalizedCache())
        return ApolloClient(networkTransport: self.networkTransport, store: store)
    }()

    private var dbURL: URL {
        let rootPath = NSSearchPathForDirectoriesInDomains(.applicationSupportDirectory, .userDomainMask, true).first!
        let dbPath = rootPath + Constants.dbPath

        if !FileManager.default.fileExists(atPath: dbPath) {
            try? FileManager.default.createDirectory(atPath:
                dbPath, withIntermediateDirectories: true, attributes: nil)
        }

        return URL(fileURLWithPath: dbPath).appendingPathComponent(Constants.dbName)
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
