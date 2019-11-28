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
    
    var body: some View {
        Group {
            if viewModel.days.count > 0 {
                Text("Loaded")
            } else {
                Text("Loading...")
            }
        }.onAppear {
            self.viewModel.refresh()
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView()
    }
    
}
