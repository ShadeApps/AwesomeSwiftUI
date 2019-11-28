//
//  NavBarButton.swift
//  AwesomeSwiftUI
//
//  Created by Sergey Grischyov on 28.11.2019.
//  Copyright © 2019 Sergey Grischyov. All rights reserved.
//

import SwiftUI

struct NavBarButtonStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(10)
            .font(.system(size: 20))
            .foregroundColor(Color.black)
    }
}
