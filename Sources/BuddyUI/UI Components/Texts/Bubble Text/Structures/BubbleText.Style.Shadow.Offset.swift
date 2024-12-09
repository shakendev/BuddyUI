//
//  BubbleText.Style.Shadow.Offset.swift
//  BuddyUI
//
//  Created by Dimka Novikov on 09.12.2024.
//  Copyright © 2024 DDEC. All rights reserved.
//


// MARK: Import section

import CoreGraphics



// MARK: - BubbleText.Style.Shadow.Offset

extension BubbleText.Style.Shadow {

    // MARK: - Public structures

    ///
    ///
    ///
    public struct Offset {

        // MARK: - Private properties

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
