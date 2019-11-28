//
//  RootView.swift
//  AwesomeSwiftUI
//
//  Created by Sergey Grischyov on 27.11.2019.
//  Copyright © 2019 Sergey Grischyov. All rights reserved.
//

import SwiftUI

struct RootView: View {
    // MARK: - Initialization
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
}

// MARK: - Extensions
private extension RootView {
    
    var list: some View {
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
    
    var errorView: some View {
        return VStack {
            Text("ErrorText").modifier(HeaderTextStyle()).padding()
            Button("ErrorButton") {
                self.viewModel.refresh()
            }
        }
    }
    
    var dateSortIcon: Image {
        return Image(systemName: isSortingByDate ?
        UIConstants.sortCalendarIconFilled : UIConstants.sortCalendarIcon)
    }
    
    var typeSortIcon: Image {
        return Image(systemName: isSortingByType ?
        UIConstants.sortTransactionIconFilled : UIConstants.sortTransactionIcon)
    }
    
    var showLoader: Bool {
        return viewModel.days.count == 0 && viewModel.error.isNone && !viewModel.finishedDataLoad
    }
    
    func toggleSort(withDate: Bool) {
        HapticHelper.vibrateLightTap()
        withDate ? isSortingByDate.toggle() : isSortingByType.toggle()
    }
    
    func isCashback(_ transaction: Transaction) -> Bool {
        return transaction.transactionObject.type == .cashback
    }
    
    func imageName(_ transaction: Transaction) -> String {
        var imageName = transaction.image?.iconName ?? ""
        if isCashback(transaction) {
            imageName = UIConstants.imageNameCashback
        }
        
        //Checking if image can be initialized, providing fallback option
        if UIImage(named: imageName) == nil {
            imageName = UIConstants.imageNameDefault
        }
        
        return imageName
    }
}
