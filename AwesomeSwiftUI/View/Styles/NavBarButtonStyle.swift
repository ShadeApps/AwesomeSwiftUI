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
            .padding(UIConstants.navBarButtonPadding)
            .font(.system(size: UIConstants.navBarButtonSize))
            .foregroundColor(UIConstants.buttonColor.swiftColor)
    }
    
}
