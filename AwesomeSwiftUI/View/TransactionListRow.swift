//
//  TransactionListRow.swift
//  AwesomeSwiftUI
//
//  Created by Sergey Grischyov on 28.11.2019.
//  Copyright © 2019 Sergey Grischyov. All rights reserved.
//

import SwiftUI

struct TransactionListRow: View {
    
    var mainText = ""
    var rightText = ""
    var imageName = ""
    var isCashback = false
    
    var body: some View {
        HStack {
            Image(imageName).resizable().cornerRadius(16, antialiased: true).frame(width: 44, height: 44, alignment: .center).aspectRatio(contentMode: .fill)
            Spacer()
            if isCashback {
                Text(mainText).modifier(CashbackTextStyle())
            } else {
                Text(mainText).modifier(DefaultTextStyle())
            }
            Spacer()
            Text(rightText)
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: UIConstants.headerHeight, maxHeight: .infinity, alignment: .center)
        .background(Color.white)
        .listRowInsets(EdgeInsets(top: 0, leading: UIConstants.headerInset, bottom: 0, trailing: UIConstants.headerInset))
    }
}
