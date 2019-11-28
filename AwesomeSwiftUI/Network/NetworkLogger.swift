//
//  NetworkLogger.swift
//  AwesomeSwiftUI
//
//  Created by Sergey Grischyov on 27.11.2019.
//  Copyright © 2019 Sergey Grischyov. All rights reserved.
//

import Foundation

struct NetworkLogger {

    enum NetworkLogType {
        case error
        case debug
    }

    static func log(_ type: NetworkLogType, _ data: String) {
        switch type {
        case .error:
            print(data)
        default:
            #if DEBUG
            print(data)
            #endif
        }
    }
}
