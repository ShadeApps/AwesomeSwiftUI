//
//  Optional.swift
//  AwesomeSwiftUI
//
//  Created by Sergey Grischyov on 28.11.2019.
//  Copyright © 2019 Sergey Grischyov. All rights reserved.
//

import Foundation

extension Optional {

    var isNone: Bool {
        if case .none = self {
            return true
        }

        return false
    }

    var isSome: Bool {
        if case .some = self {
            return true
        }

        return false
    }
}
