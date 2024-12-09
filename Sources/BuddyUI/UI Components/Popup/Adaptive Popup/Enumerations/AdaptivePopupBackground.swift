//
//  AdaptivePopupBackground.swift
//  BuddyUI
//
//  Created by Dimka Novikov on 09.12.2024.
//  Copyright © 2024 DDEC. All rights reserved.
//


// MARK: Import section

import SwiftUI



// MARK: - AdaptivePopupBackground

///
///
///
@available(iOS 18.0, *)
public enum AdaptivePopupBackground {

    ///
    ///
    ///
    case clear

    ///
    ///
    ///
    case blur(radius: CGFloat)

    ///
    ///
    ///
    case fill(color: Color)
}
