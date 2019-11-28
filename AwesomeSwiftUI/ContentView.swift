//
//  ContentView.swift
//  AwesomeSwiftUI
//
//  Created by Sergey Grischyov on 27.11.2019.
//  Copyright © 2019 Sergey Grischyov. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel = TransactionViewModel()
    @State private var isSortingByDate = false {
        didSet {
            
        }
    }
    @State private var isSortingByType = false {
        didSet {
            
        }
    }
    
    var body: some View {
        NavigationView {
            Text("Hey")
            }.navigationBarTitle("", displayMode: .inline)
                .navigationBarItems(leading:
                    Button(action: {
                        self.isSortingByDate.toggle()
                    }, label: {
                        dateSortIcon
                    }).modifier(NavBarButtonStyle()),
                                    trailing:
                    Button(action: {
                        self.isSortingByType.toggle()
                    }, label: {
                        typeSortIcon
                    }).modifier(NavBarButtonStyle())
            )
    }
    
    private var dateSortIcon: Image {
        return Image(systemName: isSortingByDate ?
        UIConstants.sortCalendarIconFilled : UIConstants.sortCalendarIcon)
    }
    
    private var typeSortIcon: Image {
        return Image(systemName: isSortingByType ?
        UIConstants.sortTransactionIconFilled : UIConstants.sortTransactionIcon)
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView()
    }
    
}
