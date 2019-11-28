//
//  TransactionListHeader.swift
//  AwesomeSwiftUI
//
//  Created by Sergey Grischyov on 28.11.2019.
//  Copyright © 2019 Sergey Grischyov. All rights reserved.
//

import SwiftUI

struct TransactionListHeader: View {
    
    var leftText = ""
    var rightText = ""
    
    var body: some View {
        HStack {
            Text(leftText).modifier(HeaderTextStyle())
            Spacer()
            Text(rightText)
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: UIConstants.headerHeight, maxHeight: .infinity, alignment: .center)
        .background(Color.white)
        .listRowInsets(EdgeInsets(top: 0, leading: UIConstants.headerInset, bottom: 0, trailing: UIConstants.headerInset))
    }
}
