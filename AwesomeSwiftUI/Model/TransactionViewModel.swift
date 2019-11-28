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

    func refresh() {
        dataProvider.getTransactions()
        let dataSubscriber = dataProvider
            .publisher
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { (error) in
                self.didChange.send(completion: error)
            }) { (values) in
                self.days = values
                self.unsortedDays = values
        }
        transactionSubscriber = AnyCancellable(dataSubscriber)
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
                
                for var object in tmpDays where object.transactions != nil  {
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
