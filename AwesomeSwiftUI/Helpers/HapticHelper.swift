//
//  HapticHelper.swift
//  AwesomeSwiftUI
//
//  Created by Sergey Grischyov on 28.11.2019.
//  Copyright © 2019 Sergey Grischyov. All rights reserved.
//

import UIKit

struct HapticHelper {
    
    static func vibrateError() {
        UINotificationFeedbackGenerator().notificationOccurred(.error)
    }

    static func vibrateWarning() {
        UINotificationFeedbackGenerator().notificationOccurred(.warning)
    }

    static func vibrateSuccess() {
        UINotificationFeedbackGenerator().notificationOccurred(.success)
    }

    static func vibrateLightTap() {
        UIImpactFeedbackGenerator(style: .light).impactOccurred()
    }

    static func vibrateMediumTap() {
        UIImpactFeedbackGenerator(style: .medium).impactOccurred()
    }

    static func vibrateHeavyTap() {
        UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
    }

    static func vibrateSelectionChanged() {
        UISelectionFeedbackGenerator().selectionChanged()
    }
    
}
