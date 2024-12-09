//
//  CGSize+.swift
//  BuddyUI
//
//  Created by Dimka Novikov on 09.12.2024.
//  Copyright © 2024 DDEC. All rights reserved.
//


// MARK: Import section

import CoreGraphics



// MARK: - CGSize+

@available(iOS 18.0, *)
extension CGSize {

    // MARK: - Public properties

    ///
    ///
    ///
    public static let identity: Self = .init(width: 1, height: 1)

    ///
    ///
    ///
    public static let zero: Self = .init(width: 0, height: 0)
}
