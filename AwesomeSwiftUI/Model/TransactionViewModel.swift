//
//  TransactionViewModel.swift
//  AwesomeSwiftUI
//
//  Created by Sergey Grischyov on 27.11.2019.
//  Copyright © 2019 Sergey Grischyov. All rights reserved.
//

import Foundation
import Combine

enum TransactionViewModelError: Error {
    case unknown
}

final class TransactionViewModel: ObservableObject {

    enum TransactionViewModelSortType {
        case dateAscending
        case dateDescending
    }

    enum TransactionViewModelFilterType {
        case typeAll
        case typeCashback
    }

    private let dataProvider = TransactionProvider()
    private var transactionSubscriber: AnyCancellable?
    var didChange = PassthroughSubject<TransactionViewModel, Error>()

    private var sortType = TransactionViewModelSortType.dateDescending
    private var unsortedDays = [TransactionDay]()
    @Published private(set) var days = [TransactionDay]() {
        didSet {
            didChange.send(self)
        }
    }
    @Published private(set) var error: Error?
    @Published private(set) var finishedDataLoad = false

    func refresh() {
        error = nil
        finishedDataLoad = false

        //Delay solely for aesthetic purposes
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.dataProvider.getTransactions()
            let dataSubscriber = self.dataProvider
                .publisher
                .receive(on: RunLoop.main)
                .sink(receiveCompletion: { (error) in
                    self.error = TransactionViewModelError.unknown
                    self.didChange.send(completion: error)
                }) { (values) in
                    self.error = nil
                    self.days = values
                    self.unsortedDays = values
                    self.finishedDataLoad = true
            }
            self.transactionSubscriber = AnyCancellable(dataSubscriber)
        }
    }

    func sortInPlace(_ type: TransactionViewModelSortType) {
        sortType = type

        var newDays = days
        days = [TransactionDay]()

        //Delay for smoother animations
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.days = self.sortedByDate(&newDays)
        }
    }

    func filterInPlace(_ type: TransactionViewModelFilterType) {
        var newDays = days
        days = [TransactionDay]()

        //Delay for smoother animations
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            newDays = self.sortedByDate(&self.unsortedDays)

            if type == .typeCashback {
                let tmpDays = newDays
                newDays = [TransactionDay]()

                for var object in tmpDays where object.transactions.isSome {
                    object.transactions = object.transactions!.filter({ $0.transactionObject.type == .cashback })
                    if object.transactions?.count != 0 {
                        newDays.append(object)
                    }
                }
            }

            self.days = newDays
        }
    }

    @discardableResult
    private func sortedByDate(_ days: inout [TransactionDay]) -> [TransactionDay] {
        switch sortType {
        case .dateAscending:
            days.sort(by: { $0.date < $1.date })
        case .dateDescending:
            days.sort(by: { $0.date > $1.date })
        }

        return days
    }
}
