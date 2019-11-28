//
//  AwesomeSwiftUITests.swift
//  AwesomeSwiftUITests
//
//  Created by Sergey Grischyov on 27.11.2019.
//  Copyright © 2019 Sergey Grischyov. All rights reserved.
//

import Quick
import Nimble

@testable import AwesomeSwiftUI

class AwesomeSwiftUITests: QuickSpec {
    
    override func spec() {
        testDateFormatters()
        testAmountFormatters()
    }
    
    func testDateFormatters() {
        let date = "2019-11-29"
        let textDate = "November, 29"
        
        describe("Testing date formatters") {
            it("Should convert string to date") {
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = UIConstants.dateFormatterInput
                let rightDate = dateFormatter.date(from: date)
                
                expect(DateFormatterHelper.dateFromString(date)).toEventually(equal(rightDate))
            }
            
            it("Should convert date to string") {
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = UIConstants.dateFormatterInput
                let rightDate = dateFormatter.date(from: date) ?? Date()
                
                expect(DateFormatterHelper.stringFromDate(rightDate)).toEventually(equal(textDate))
            }
        }
    }
    
    func testAmountFormatters() {
        let transactionAmount = Transaction.TransactionObject.AmountObject(value: "-100500", currencyCode: .rub)
        let transcationResult = "-₽100500"
        let daySectionAmount = DaySection.AmountObject(value: "5000", currencyCode: .usd)
        let daySectionResult = "+$5000"
        
        describe("Testing amount formatters") {
            it("Should convert transactionAmount to printable string") {
                expect(AmountHelper.stringFromAmount(transactionAmount)).toEventually(equal(transcationResult))
            }
            
            it("Should convert daySectionAmount to printable string") {
                expect(AmountHelper.stringFromAmount(daySectionAmount)).toEventually(equal(daySectionResult))
            }
        }
    }
}

