//
//  TransactionViewModel.swift
//  AwesomeSwiftUI
//
//  Created by Sergey Grischyov on 27.11.2019.
//  Copyright © 2019 Sergey Grischyov. All rights reserved.
//

import Foundation
import Combine

final class TransactionViewModel : ObservableObject {

    private let dataProvider = TransactionProvider()
    private var transactionSubscriber: AnyCancellable?
    var didChange = PassthroughSubject<TransactionViewModel, Error>()
    
    private(set) var days = [TransactionDay]() {
        didSet {
            didChange.send(self)
        }
    }

    func refresh() {
        dataProvider.getTransactions()
        let dataSubscriber = dataProvider
            .publisher
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { (error) in
                self.didChange.send(completion: error)
            }) { (values) in
                self.days = values
        }
        transactionSubscriber = AnyCancellable(dataSubscriber)
    }
}
