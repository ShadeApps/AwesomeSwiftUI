//
//  TransactionProvider.swift
//  AwesomeSwiftUI
//
//  Created by Sergey Grischyov on 27.11.2019.
//  Copyright © 2019 Sergey Grischyov. All rights reserved.
//

import Foundation
import Combine

final class TransactionProvider {
    
    private var transactions: [TransactionDay]?
    
    func getTransactions() {
        NetworkClient.shared.apollo.fetch(query: TransactionListQuery(), cachePolicy: .returnCacheDataAndFetch) { result in
            guard let data = try? result.get().data else { return }

            if let responseData = data.dailyTransactionsFeed {
                self.normalizeResponse(responseData)
            } else {
                //Error
            }
        }
    }

    private func normalizeResponse(_ response: [TransactionListQuery.Data.DailyTransactionsFeed?]) {
        //This is necessary because DaySection does NOT contain Transaction inside itself as it normally should

        transactions = [TransactionDay]()
        var newDay: TransactionDay?

        for object in response {
            if let fragment = object?.fragments.daySection {
                if let day = newDay, !(day.transactions?.isEmpty ?? false) {
                    transactions?.append(day)
                }

                newDay = TransactionDay()
                newDay?.date = fragment.date
                newDay?.amount = fragment.amountObject
                newDay?.transactions = [Transaction]()
            }

            if let transactionFragment = object?.fragments.transaction {
                newDay?.transactions?.append(transactionFragment)
            }
        }
    }
    
}


