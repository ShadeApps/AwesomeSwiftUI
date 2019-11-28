//
//  TransactionDay.swift
//  AwesomeSwiftUI
//
//  Created by Sergey Grischyov on 27.11.2019.
//  Copyright © 2019 Sergey Grischyov. All rights reserved.
//

import Foundation

struct TransactionDay {
    //TransactionDay model is necessary because DaySection does NOT contain Transaction inside itself
    //Otherwise, we would just use DaySection with a collection of Transaction objects inside

    var date = Date()
    var transactions: [Transaction]?
    var amount: DaySection.AmountObject?

    var printableDate: String {
        return DateFormatterHelper.stringFromDate(date)
    }

    var printableAmount: String {
        return AmountHelper.stringFromAmount(amount)
    }
}
