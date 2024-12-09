//
//  BubbleButton.Style.Shadow.swift
//  BuddyUI
//
//  Created by Dimka Novikov on 09.12.2024.
//  Copyright © 2024 DDEC. All rights reserved.
//


// MARK: Import section

import CoreGraphics



// MARK: - BubbleButton.Style.Shadow

extension BubbleButton.Style {

    // MARK: - Public structures

    ///
    ///
    ///
    public struct Shadow {

        // MARK: - Public properties

        let radius: CGFloat

        let width: CGFloat

        let offset: Offset



        // MARK: - Init

        ///
        ///
        ///
        public init(
            blur radius: CGFloat = .zero,
            width: CGFloat = .zero,
            offset: Offset = .init()
        ) {
            self.radius = radius
            self.width = width
            self.offset = offset
        }
    }
}
