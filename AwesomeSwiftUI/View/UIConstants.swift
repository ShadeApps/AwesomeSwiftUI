//
//  UIConstants.swift
//  AwesomeSwiftUI
//
//  Created by Sergey Grischyov on 28.11.2019.
//  Copyright © 2019 Sergey Grischyov. All rights reserved.
//

import Foundation
import UIKit

enum UIConstants {
    static let sortCalendarIcon = "calendar"
    static let sortCalendarIconFilled = "calendar.badge.plus"
    static let sortTransactionIcon = "creditcard"
    static let sortTransactionIconFilled = "creditcard.fill"
    
    static let dateFormatterInput = "YYYY-MM-dd"
    static let dateFormatterOutput = "MMMM, d"
    
    static let headerHeight = CGFloat(60)
    static let headerInset = CGFloat(25)
}

func applyAppearanceStyles() {
    UINavigationBar.appearance().shadowImage = UIImage()
    UINavigationBar.appearance().backgroundColor = .white
    UINavigationBar.appearance().barTintColor = .white
    UITableViewHeaderFooterView.appearance().tintColor = .white
}
