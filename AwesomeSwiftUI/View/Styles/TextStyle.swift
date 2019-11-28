//
//  TextStyle.swift
//  AwesomeSwiftUI
//
//  Created by Sergey Grischyov on 28.11.2019.
//  Copyright © 2019 Sergey Grischyov. All rights reserved.
//

import SwiftUI

struct HeaderTextStyle: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font(.system(size: UIConstants.headerTextSize, weight: .regular, design: .default))
            .foregroundColor(UIConstants.grayTextColor.swiftColor)
    }
    
}

struct DefaultTextStyle: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font(.system(size: UIConstants.headerTextSize, weight: .regular, design: .default))
            .foregroundColor(UIConstants.defaultTextColor.swiftColor)
    }
    
}

struct CashbackTextStyle: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font(.system(size: UIConstants.headerTextSize, weight: .regular, design: .default))
            .foregroundColor(UIConstants.greenTextColor.swiftColor)
    }
    
}
