//
//  TransactionDay.swift
//  AwesomeSwiftUI
//
//  Created by Sergey Grischyov on 27.11.2019.
//  Copyright © 2019 Sergey Grischyov. All rights reserved.
//

import Foundation

struct TransactionDay {
    //TransactionDay proxy model is necessary because DaySectionWidget does NOT contain TransactionWidget inside itself
    //Otherwise, we would just use DaySectionWidget with a collection of TransactionWidget inside it
    
    var date: String?
    var transactions: [TransactionFragment]?
    var amount: DaySectionWidgetFragment.Amount?
    
}
