//
//  TransactionListFooter.swift
//  AwesomeSwiftUI
//
//  Created by Sergey Grischyov on 28.11.2019.
//  Copyright © 2019 Sergey Grischyov. All rights reserved.
//

import SwiftUI

struct TransactionListFooter: View {
    
    var body: some View {
        VStack {
            Spacer()
            Rectangle()
                .fill(UIConstants.separatorColor.swiftColor)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: UIConstants.footerHeight,
                       maxHeight: UIConstants.footerHeight, alignment: .center)
        }.frame(minWidth: 0, maxWidth: .infinity, minHeight: UIConstants.headerHeight / 2,
                maxHeight: .infinity, alignment: .center)
            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
    }
    
}
