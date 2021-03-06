//
//  TransactionProvider.swift
//  AwesomeSwiftUI
//
//  Created by Sergey Grischyov on 27.11.2019.
//  Copyright © 2019 Sergey Grischyov. All rights reserved.
//

import Foundation
import Apollo
import Combine

final class TransactionProvider: NSObject {
    // MARK: - Initialization
    private let dataPublisher: PassthroughSubject<[TransactionDay], Error>
    private var transactions = [TransactionDay]()
    var publisher: AnyPublisher<[TransactionDay], Error>

    override init() {
        dataPublisher = PassthroughSubject<[TransactionDay], Error>()
        publisher = dataPublisher.eraseToAnyPublisher()
        super.init()
    }

    func getTransactions(withCachePolicy policy: CachePolicy = .returnCacheDataElseFetch) {
        NetworkClient.shared.apollo.fetch(query: TransactionListQuery(), cachePolicy: policy) { result in
            switch result {
            case .success(let graphQLResult):
                if let data = try? result.get().data,
                let responseData = data.dailyTransactionsFeed {
                    self.normalizeAndPublishResponse(responseData)
                } else if let firstError = graphQLResult.errors?.first {
                    self.dataPublisher.send(completion: Subscribers.Completion.failure(firstError))
                }
            case .failure(let error):
                NetworkLogger.log(.error, "getTransactions error")
                self.dataPublisher.send(completion: Subscribers.Completion.failure(error))
            }
        }
    }
}

// MARK: - Extensions
private extension TransactionProvider {

    func normalizeAndPublishResponse(_ response: [TransactionListQuery.Data.DailyTransactionsFeed?]) {
        //This is necessary because DaySection does NOT contain Transaction inside itself as it normally should

        transactions = [TransactionDay]()
        var newDay: TransactionDay?

        for object in response {
            if let fragment = object?.fragments.daySection {
                if let day = newDay, day.transactions?.count != 0 {
                    transactions.append(day)
                }

                newDay = TransactionDay()
                newDay?.date = DateFormatterHelper.dateFromString(fragment.date)
                newDay?.amount = fragment.amountObject
                newDay?.transactions = [Transaction]()
            }

            if let transactionFragment = object?.fragments.transaction {
                newDay?.transactions?.append(transactionFragment)
            }
        }

        if let day = newDay, day.transactions?.count != 0 {
            transactions.append(day)
        }

        dataPublisher.send(transactions)
    }

}
