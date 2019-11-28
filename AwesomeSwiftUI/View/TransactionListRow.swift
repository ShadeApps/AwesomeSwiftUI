//
//  TransactionListRow.swift
//  AwesomeSwiftUI
//
//  Created by Sergey Grischyov on 28.11.2019.
//  Copyright © 2019 Sergey Grischyov. All rights reserved.
//

import SwiftUI

struct TransactionListRow: View {
// MARK: - Initialization
    var mainText = ""
    var rightText = ""
    var imageName = ""
    var isCashback = false
    
    var body: some View {
        HStack {
            Image(imageName).resizable()
                .cornerRadius(UIConstants.imageCornerRadius, antialiased: true)
                .frame(width: UIConstants.imageSize, height: UIConstants.imageSize, alignment: .center)
            if isCashback {
                Text(mainText).modifier(CashbackTextStyle())
            } else {
                Text(mainText).modifier(DefaultTextStyle())
            }
            Spacer()
            Text(rightText)
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: UIConstants.headerHeight, maxHeight: .infinity, alignment: .center)
        .background(backgroundColor).cornerRadius(cornerRadius, antialiased: true)
        .listRowInsets(EdgeInsets(top: 0, leading: inset, bottom: 0, trailing: inset))
    }
}

// MARK: - Extensions
private extension TransactionListRow {
    
    var cornerRadius: CGFloat {
        return isCashback ? UIConstants.imageCornerRadius / 2 : 0
    }
    
    var inset: CGFloat {
        return isCashback ? UIConstants.headerInset / 2 : UIConstants.headerInset
    }
    
    var backgroundColor: Color {
        return isCashback ? UIConstants.greenBackgroundColor.swiftColor : Color.white
    }
    
}
