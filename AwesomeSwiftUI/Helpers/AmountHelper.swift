//
//  AmountHelper.swift
//  AwesomeSwiftUI
//
//  Created by Sergey Grischyov on 28.11.2019.
//  Copyright © 2019 Sergey Grischyov. All rights reserved.
//

import Foundation

struct AmountHelper {
    
    static func stringFromAmount(_ amount: DaySection.AmountObject?) -> String {
        guard let amount = amount else {
            return ""
        }
        
        var finalString = amount.fragments.amount.value
        let currency = printableCurrency(amount.fragments.amount.currencyCode)
        
        if finalString.contains("-") {
            finalString = finalString
                .replacingOccurrences(of: "-", with: "-" + currency)
        } else {
            finalString = "+" + currency + finalString
        }
        
        return finalString
    }
    
    private static func printableCurrency(_ currency: CurrencyCode) -> String {
        var value = ""
        switch currency {
        case .gbp:
            value = "£"
        case .rub:
            value = "₽"
        case .usd:
            value = "$"
        default:
            break
        }
        return value
    }
    
}
