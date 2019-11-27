//
//  TransactionViewModel.swift
//  AwesomeSwiftUI
//
//  Created by Sergey Grischyov on 27.11.2019.
//  Copyright © 2019 Sergey Grischyov. All rights reserved.
//

import Foundation
import Combine
import SwiftUI

final class TransactionViewModel : ObservableObject {

    private let dataProvider = TransactionProvider()
    var didChange = PassthroughSubject<TransactionViewModel, Never>()
    
    private(set) var days: [TransactionDay]? {
        didSet {
            didChange.send(self)
        }
    }

    func refresh() {
        dataProvider.getTransactions()
    }
}
