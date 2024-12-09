//
//  BubbleButton.Style.Shadow.Offset.swift
//  BuddyUI
//
//  Created by Dimka Novikov on 09.12.2024.
//  Copyright © 2024 DDEC. All rights reserved.
//


// MARK: Import section

import CoreGraphics



// MARK: - BubbleButton.Style.Shadow.Offset

extension BubbleButton.Style.Shadow {

    // MARK: - Public structures

    ///
    ///
    ///
    public struct Offset {

        // MARK: - Public properties

        let x: CGFloat
        let y: CGFloat



        // MARK: - Init

        ///
        ///
        ///
        public init(
            x: CGFloat = .zero,
            y: CGFloat = .zero
        ) {
            self.x = x
            self.y = y
        }
    }
}
