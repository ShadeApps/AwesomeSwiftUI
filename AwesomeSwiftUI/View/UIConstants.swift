//
//  UIConstants.swift
//  AwesomeSwiftUI
//
//  Created by Sergey Grischyov on 28.11.2019.
//  Copyright © 2019 Sergey Grischyov. All rights reserved.
//

import UIKit
import Foundation
import SFSafeSymbols

enum UIConstants {
    static let sceneConfigurationName = "Default Configuration"
    
    static let dateFormatterInput = "YYYY-MM-dd"
    static let dateFormatterOutput = "MMMM, d"
    
    static let sortCalendarIcon = SFSymbol.calendar
    static let sortCalendarIconFilled = SFSymbol.calendarBadgePlus
    static let sortTransactionIcon = SFSymbol.creditcard
    static let sortTransactionIconFilled = SFSymbol.creditcardFill
    
    static let headerHeight = CGFloat(60)
    static let headerInset = CGFloat(25)
    static let footerHeight = CGFloat(6)
    
    static let headerTextSize = CGFloat(16)
    static let navBarButtonSize = CGFloat(20)
    static let navBarButtonPadding = CGFloat(10)
    
    static let imageSize = CGFloat(44)
    static let imageCornerRadius = CGFloat(18)
    
    static let grayTextColor = #colorLiteral(red: 0.5840002894, green: 0.6183772087, blue: 0.6606831551, alpha: 1)
    static let defaultTextColor = #colorLiteral(red: 0.1960240602, green: 0.1960524917, blue: 0.1960143745, alpha: 1)
    static let greenTextColor = #colorLiteral(red: 0.4416535497, green: 0.5971063972, blue: 0.3120738864, alpha: 1)
    static let greenBackgroundColor = #colorLiteral(red: 0.9366807938, green: 0.9810544848, blue: 0.9000988603, alpha: 1)
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
