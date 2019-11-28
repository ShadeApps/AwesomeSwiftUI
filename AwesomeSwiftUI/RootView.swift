//
//  RootView.swift
//  AwesomeSwiftUI
//
//  Created by Sergey Grischyov on 27.11.2019.
//  Copyright © 2019 Sergey Grischyov. All rights reserved.
//

import SwiftUI

struct RootView: View {
    
    @ObservedObject var viewModel = TransactionViewModel()
    @State private var isSortingByDate = false {
        didSet {
            viewModel.sortInPlace(isSortingByDate ? .dateAscending : .dateDescending)
        }
    }
    @State private var isSortingByType = false {
        didSet {
            viewModel.filterInPlace(isSortingByType ? .typeCashback : .typeAll)
        }
    }
    
    init() {
        applyAppearanceStyles()
    }
    
    var body: some View {
        NavigationView {
            if showLoader {
                LoaderView()
            } else if viewModel.error.isSome {
                errorView
            } else {
                list.navigationBarTitle("RootViewTitle", displayMode: .inline)
                .navigationBarItems(leading:
                    Button(action: {
                        self.toggleSort(withDate: true)
                    }, label: {
                        dateSortIcon
                    }).modifier(NavBarButtonStyle()),
                                    trailing:
                    Button(action: {
                        self.toggleSort(withDate: false)
                    }, label: {
                        typeSortIcon
                    }).modifier(NavBarButtonStyle()))
            }
        }.onAppear {
            self.viewModel.refresh()
        }
    }
    
    private var list: some View {
        return List {
            ForEach(viewModel.days, id: \.date) { day in
                Section(header: TransactionListHeader(leftText: day.printableDate, rightText: day.printableAmount),
                        footer: TransactionListFooter()) {
                            ForEach(day.transactions ?? [], id: \.transactionObject.id) { transaction in
                                TransactionListRow(mainText: transaction.transactionObject.title,
                                rightText: AmountHelper.stringFromAmount(transaction.transactionObject.amountObject),
                                imageName: self.imageName(transaction), isCashback: self.isCashback(transaction))
                            }
                }
            }
        }.background(Color.white)
    }
    
    private var errorView: some View {
        return VStack {
            Text("ErrorText").modifier(HeaderTextStyle()).padding()
            Button("ErrorButton") {
                self.viewModel.refresh()
            }
        }
    }
    
    private var dateSortIcon: Image {
        return Image(systemName: isSortingByDate ?
        UIConstants.sortCalendarIconFilled : UIConstants.sortCalendarIcon)
    }
    
    private var typeSortIcon: Image {
        return Image(systemName: isSortingByType ?
        UIConstants.sortTransactionIconFilled : UIConstants.sortTransactionIcon)
    }
    
    private var showLoader: Bool {
        if isSortingByDate || isSortingByType {
            return false
        }
        
        return viewModel.days.count == 0 && viewModel.error.isNone
    }
    
    private func toggleSort(withDate: Bool) {
        HapticHelper.vibrateLightTap()
        withDate ? isSortingByDate.toggle() : isSortingByType.toggle()
    }
    
    private func isCashback(_ transaction: Transaction) -> Bool {
        return transaction.transactionObject.type == .cashback
    }
    
    private func imageName(_ transaction: Transaction) -> String {
        var imageName = transaction.image?.iconName ?? ""
        if isCashback(transaction) {
            imageName = "cashback"
        }
        return imageName
    }
    
}
