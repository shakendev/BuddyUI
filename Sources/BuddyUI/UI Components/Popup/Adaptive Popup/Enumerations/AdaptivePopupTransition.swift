//
//  AdaptivePopupTransition.swift
//  BuddyUI
//
//  Created by Dimka Novikov on 09.12.2024.
//  Copyright © 2024 DDEC. All rights reserved.
//


// MARK: Import section

import CoreGraphics



// MARK: - AdaptivePopupTransition

///
///
///
@available(iOS 18.0, *)
public enum AdaptivePopupTransition {

    ///
    ///
    ///
    case center(scale: CGSize)

    ///
    ///
    ///
    case path(from: CGPoint, to: CGPoint, scale: CGSize)
}
