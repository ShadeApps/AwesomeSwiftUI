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
    static let footerHeight = CGFloat(6)
    
    static let headerTextSize = CGFloat(16)
    static let navBarButtonSize = CGFloat(20)
    static let navBarButtonPadding = CGFloat(10)
    
    static let grayTextColor = #colorLiteral(red: 0.5840002894, green: 0.6183772087, blue: 0.6606831551, alpha: 1)
    static let separatorColor = #colorLiteral(red: 0.9593116641, green: 0.9766505361, blue: 0.9976657033, alpha: 1)
    static let buttonColor = #colorLiteral(red: 0.2900780439, green: 0.3133128285, blue: 0.3779925108, alpha: 1)
}

func applyAppearanceStyles() {
    UINavigationBar.appearance().shadowImage = UIImage()
    UINavigationBar.appearance().backgroundColor = .white
    UINavigationBar.appearance().barTintColor = .white
    UITableViewHeaderFooterView.appearance().tintColor = .white
    UITableView.appearance().separatorColor = .clear
}
