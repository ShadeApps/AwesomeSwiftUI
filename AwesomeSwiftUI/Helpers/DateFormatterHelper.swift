//
//  DateFormatterHelper.swift
//  AwesomeSwiftUI
//
//  Created by Sergey Grischyov on 28.11.2019.
//  Copyright © 2019 Sergey Grischyov. All rights reserved.
//

import Foundation

struct DateFormatterHelper {
    
    static func dateFromString(_ string: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = UIConstants.dateFormatterInput
        return dateFormatter.date(from: string) ?? Date()
    }
    
    static func stringFromDate(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = UIConstants.dateFormatterOutput
        return dateFormatter.string(from: date)
    }
    
}
