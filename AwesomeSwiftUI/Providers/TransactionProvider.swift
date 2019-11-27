//
//  TransactionProvider.swift
//  AwesomeSwiftUI
//
//  Created by Sergey Grischyov on 27.11.2019.
//  Copyright © 2019 Sergey Grischyov. All rights reserved.
//

import Foundation

struct TransactionProvider {
    
    static func getTransactions() {
        NetworkClient.shared.apollo.fetch(query: TransactionListQuery()) { result in
            guard let data = try? result.get().data else { return }
        }
    }
    
}


