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
            if isCashback {
                cashbackBarrier
            }
            Image(imageName).resizable()
                .cornerRadius(UIConstants.imageCornerRadius, antialiased: true)
                .frame(width: UIConstants.imageSize, height: UIConstants.imageSize, alignment: .center)
            barrier
            if isCashback {
                Text(mainText).modifier(CashbackTextStyle())
            } else {
                Text(mainText).modifier(DefaultTextStyle())
            }
            Spacer()
            Text(rightText)
            if isCashback {
                cashbackBarrier
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: UIConstants.headerHeight, maxHeight: .infinity, alignment: .center)
        .background(backgroundColor).cornerRadius(cornerRadius, antialiased: true)
        .listRowInsets(EdgeInsets(top: 0, leading: inset, bottom: 0, trailing: inset))
    }
}

// MARK: - Extensions
private extension TransactionListRow {
    
    var barrier: some View {
        return Rectangle()
            .fill(backgroundColor)
            .frame(minWidth: 0, maxWidth: UIConstants.headerInset / 2, minHeight: 0,
               maxHeight: UIConstants.headerHeight, alignment: .center)
    }
    
    var cashbackBarrier: some View {
        return Rectangle()
            .fill(backgroundColor)
            .frame(minWidth: UIConstants.headerInset / 4, maxWidth: UIConstants.headerInset / 4, minHeight: 0,
                   maxHeight: UIConstants.headerHeight, alignment: .center)
    }
    
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
