//
//  LoaderView.swift
//  AwesomeSwiftUI
//
//  Created by Sergey Grischyov on 28.11.2019.
//  Copyright © 2019 Sergey Grischyov. All rights reserved.
//

import SwiftUI

struct LoaderView: View {
    
    var body: some View {
        ZStack(alignment: .center) {
            VStack {
                Text("LoadingTitle").modifier(HeaderTextStyle())
                ActivityIndicator(isAnimating: .constant(true), style: .large)
            }
        }
    }
    
}
